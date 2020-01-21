import 'package:dio/dio.dart';
import 'package:dota2/models/data_object.dart';
import 'package:dota2/models/heros.dart';
import 'package:flutter/material.dart';

final shadowStyle = TextStyle(
  fontSize: 15,
  color: Colors.white,
  shadows: [
    Shadow(
      blurRadius: 1,
      color: Colors.black,
      offset: Offset(1, 1),
    )
  ],
);

class DotaModel with ChangeNotifier {
  String baseURL = "https://api.opendota.com/api/players";
  List<DotaHero> heroes = [];
  Dio networkProvider;
  String accountID;
  Player player;
  WinLose winLose;
  List<RecentMatch> recentMatches;
  Counts counts;
  List<Heros> playedHeroes = [];
  Streak streak;
  RecentMatch longestPlay;
  RecentMatch shortestPlay;
  bool isReady = false;
  String error;
  bool withinOneYear = true;

  DotaModel({Dio networkProvider}) {
    this.networkProvider = networkProvider ?? Dio();
    this.heroes = heroData.map((h) => DotaHero.fromJson(h)).toList();
  }

  Future<void> getAll() async {
    try {
      isReady = false;
      error = null;
      notifyListeners();
      this.player = await getPlayerInfo();
      await Future.delayed(Duration(seconds: 1));
      this.winLose = await getWinLose();
      await Future.delayed(Duration(seconds: 1));
      this.recentMatches = await getRecentMatches();
      await Future.delayed(Duration(seconds: 1));
      this.playedHeroes = await getHeros();
      await Future.delayed(Duration(seconds: 1));
      this.longestPlay = await getLongestMatch();
      await Future.delayed(Duration(seconds: 1));
      this.shortestPlay = await this.getShortestMatch();
      await Future.delayed(Duration(seconds: 1));
      List<PlayerMatches> matches = await this.getPlayerMatches();
      this.streak = DotaModel.getStreak(matches);
      this.error = null;
    } catch (err) {
      print(err);
      this.error = err.toString();
    } finally {
      this.isReady = true;
      notifyListeners();
    }
  }

  double getWinRate(int win, int total) {
    return win / total;
  }

  String _getURL({@required String path, bool withinOneYear = true}) {
    if (withinOneYear) {
      return "$baseURL/$accountID/$path?date=365";
    }
    return "$baseURL/$accountID/$path";
  }

  static String getImageName(String heroName) {
    return "${heroName.replaceFirst("npc_dota_hero_", "")}_hphover.png";
  }

  Future<Player> getPlayerInfo() async {
    String url = "$baseURL/$accountID";
    Response response = await this.networkProvider.get(url);
    Player p = Player.fromJson(response.data);
    return p;
  }

  Future<WinLose> getWinLose() async {
    String url = _getURL(path: "wl", withinOneYear: withinOneYear);
    Response response = await this.networkProvider.get(url);
    return WinLose.fromJson(response.data);
  }

  Future<List<RecentMatch>> getRecentMatches() async {
    String url = _getURL(path: "recentMatches");
    var response = await this.networkProvider.get<List>(url);
    return response.data.map((d) => RecentMatch.fromJson(d)).toList();
  }

  /// get list of heros played
  Future<List<Heros>> getHeros() async {
    String url = _getURL(path: "heroes", withinOneYear: withinOneYear);
    var response = await this.networkProvider.get<List>(url);
    return response.data.map((d) => Heros.fromJson(d)).toList();
  }

  Future<List<Counts>> getCounts() async {
    String url = _getURL(path: "counts", withinOneYear: withinOneYear);
    var response = await this.networkProvider.get<List>(url);
    return response.data.map((d) => Counts.fromJson(d)).toList();
  }

  Future<RecentMatch> getLongestMatch() async {
    String url =
        "https://api.opendota.com/api/players/$accountID/matches?sort=duration&limit=1";
    var response = await this.networkProvider.get(url);
    return RecentMatch.fromJson(response.data[0]);
  }

  Future<RecentMatch> getShortestMatch() async {
    String url =
        "https://api.opendota.com/api/players/$accountID/matches?sort=duration&limit=1&offset=-1";
    var response = await this.networkProvider.get(url);
    return RecentMatch.fromJson(response.data[0]);
  }

  Future<List<PlayerMatches>> getPlayerMatches() async {
    String url;
    if (!withinOneYear) {
      url =
          "https://api.opendota.com/api/players/$accountID/matches?sort=start_time";
    } else {
      url =
          "https://api.opendota.com/api/players/$accountID/matches?sort=start_time&date=365";
    }

    var response = await this.networkProvider.get<List>(url);
    List<PlayerMatches> matches =
        response.data.map((d) => PlayerMatches.fromJson(d)).toList();
    return matches;
  }

  static Streak getStreak(List<PlayerMatches> matches) {
    // Calculate win and lose
    List<PlayerMatches> winStreaks = [];
    List<PlayerMatches> tempWinStreaks = [];
    List<PlayerMatches> loseStreaks = [];
    List<PlayerMatches> tempLoseStreaks = [];

    for (var match in matches) {
      bool isWin = (match.playerSlot <= 127 && match.radiantWin) ||
          (match.playerSlot > 127 && !match.radiantWin);
      // win
      if (isWin) {
        tempWinStreaks.add(match);
      }
      if (!isWin || match == matches.last) {
        if (tempWinStreaks.length > winStreaks.length) {
          winStreaks = tempWinStreaks
              .map((t) => t.toJson())
              .toList()
              .map((d) => PlayerMatches.fromJson(d))
              .toList();
          tempWinStreaks.clear();
        }
      }
    }

    for (var match in matches) {
      bool isWin = (match.playerSlot <= 127 && match.radiantWin) ||
          (match.playerSlot > 127 && !match.radiantWin);
      // lose
      if (!isWin) {
        tempLoseStreaks.add(match);
      }

      if (isWin || match == matches.last) {
        if (tempLoseStreaks.length > loseStreaks.length) {
          loseStreaks = tempLoseStreaks
              .map((t) => t.toJson())
              .toList()
              .map((d) => PlayerMatches.fromJson(d))
              .toList();
          tempLoseStreaks.clear();
        }
      }
    }
    return Streak(loseStreaks: loseStreaks, winStreaks: winStreaks);
  }
}
