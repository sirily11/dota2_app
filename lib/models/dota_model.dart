import 'package:dio/dio.dart';
import 'package:dota2/models/data_object.dart';
import 'package:dota2/models/heros.dart';
import 'package:flutter/material.dart';

final shadowStyle = TextStyle(
  fontSize: 20,
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
  RecentMatch longestPlay;
  RecentMatch shortestPlay;
  bool isReady = false;
  String error;

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

  String _getURL({@required String path}) {
    return "$baseURL/$accountID/$path?date=365";
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
    String url = _getURL(path: "wl");
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
    String url = _getURL(path: "heroes");
    var response = await this.networkProvider.get<List>(url);
    return response.data.map((d) => Heros.fromJson(d)).toList();
  }

  Future<List<Counts>> getCounts() async {
    String url = _getURL(path: "counts");
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
}
