class Player {
  String trackedUntil;
  String soloCompetitiveRank;
  String competitiveRank;
  Profile profile;
  String leaderboardRank;
  String rankTier;
  MmrEstimate mmrEstimate;

  Player({
    this.trackedUntil,
    this.soloCompetitiveRank,
    this.competitiveRank,
    this.profile,
    this.leaderboardRank,
    this.rankTier,
    this.mmrEstimate,
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        trackedUntil: json["tracked_until"],
        soloCompetitiveRank: json["solo_competitive_rank"],
        competitiveRank: json["competitive_rank"],
        profile: Profile.fromJson(json["profile"]),
        leaderboardRank: json["leaderboard_rank"],
        rankTier: json["rank_tier"],
        mmrEstimate: MmrEstimate.fromJson(json["mmr_estimate"]),
      );

  Map<String, dynamic> toJson() => {
        "tracked_until": trackedUntil,
        "solo_competitive_rank": soloCompetitiveRank,
        "competitive_rank": competitiveRank,
        "profile": profile.toJson(),
        "leaderboard_rank": leaderboardRank,
        "rank_tier": rankTier,
        "mmr_estimate": mmrEstimate.toJson(),
      };
}

class MmrEstimate {
  int estimate;

  MmrEstimate({
    this.estimate,
  });

  factory MmrEstimate.fromJson(Map<String, dynamic> json) => MmrEstimate(
        estimate: json["estimate"],
      );

  Map<String, dynamic> toJson() => {
        "estimate": estimate,
      };
}

class Profile {
  int accountId;
  String personaname;
  dynamic name;
  bool plus;
  int cheese;
  String steamid;
  String avatar;
  String avatarmedium;
  String avatarfull;
  String profileurl;
  String lastLogin;
  String loccountrycode;
  bool isContributor;

  Profile({
    this.accountId,
    this.personaname,
    this.name,
    this.plus,
    this.cheese,
    this.steamid,
    this.avatar,
    this.avatarmedium,
    this.avatarfull,
    this.profileurl,
    this.lastLogin,
    this.loccountrycode,
    this.isContributor,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        accountId: json["account_id"],
        personaname: json["personaname"],
        name: json["name"],
        plus: json["plus"],
        cheese: json["cheese"],
        steamid: json["steamid"],
        avatar: json["avatar"],
        avatarmedium: json["avatarmedium"],
        avatarfull: json["avatarfull"],
        profileurl: json["profileurl"],
        lastLogin: json["last_login"],
        loccountrycode: json["loccountrycode"],
        isContributor: json["is_contributor"],
      );

  Map<String, dynamic> toJson() => {
        "account_id": accountId,
        "personaname": personaname,
        "name": name,
        "plus": plus,
        "cheese": cheese,
        "steamid": steamid,
        "avatar": avatar,
        "avatarmedium": avatarmedium,
        "avatarfull": avatarfull,
        "profileurl": profileurl,
        "last_login": lastLogin,
        "loccountrycode": loccountrycode,
        "is_contributor": isContributor,
      };
}

class RecentMatch {
  int matchId;
  int playerSlot;
  bool radiantWin;
  int duration;
  int gameMode;
  int lobbyType;
  int heroId;
  int startTime;
  int version;
  int kills;
  int deaths;
  int assists;
  int skill;
  int lane;
  int laneRole;
  bool isRoaming;
  int cluster;
  int leaverStatus;
  int partySize;

  RecentMatch({
    this.matchId,
    this.playerSlot,
    this.radiantWin,
    this.duration,
    this.gameMode,
    this.lobbyType,
    this.heroId,
    this.startTime,
    this.version,
    this.kills,
    this.deaths,
    this.assists,
    this.skill,
    this.lane,
    this.laneRole,
    this.isRoaming,
    this.cluster,
    this.leaverStatus,
    this.partySize,
  });

  factory RecentMatch.fromJson(Map<String, dynamic> json) => RecentMatch(
        matchId: json["match_id"],
        playerSlot: json["player_slot"],
        radiantWin: json["radiant_win"],
        duration: json["duration"],
        gameMode: json["game_mode"],
        lobbyType: json["lobby_type"],
        heroId: json["hero_id"],
        startTime: json["start_time"],
        version: json["version"],
        kills: json["kills"],
        deaths: json["deaths"],
        assists: json["assists"],
        skill: json["skill"],
        lane: json["lane"],
        laneRole: json["lane_role"],
        isRoaming: json["is_roaming"],
        cluster: json["cluster"],
        leaverStatus: json["leaver_status"],
        partySize: json["party_size"],
      );

  Map<String, dynamic> toJson() => {
        "match_id": matchId,
        "player_slot": playerSlot,
        "radiant_win": radiantWin,
        "duration": duration,
        "game_mode": gameMode,
        "lobby_type": lobbyType,
        "hero_id": heroId,
        "start_time": startTime,
        "version": version,
        "kills": kills,
        "deaths": deaths,
        "assists": assists,
        "skill": skill,
        "lane": lane,
        "lane_role": laneRole,
        "is_roaming": isRoaming,
        "cluster": cluster,
        "leaver_status": leaverStatus,
        "party_size": partySize,
      };
}

class WinLose {
  int win;
  int lose;

  WinLose({
    this.win,
    this.lose,
  });

  factory WinLose.fromJson(Map<String, dynamic> json) => WinLose(
        win: json["win"],
        lose: json["lose"],
      );

  Map<String, dynamic> toJson() => {
        "win": win,
        "lose": lose,
      };
}

class Heros {
  String heroId;
  int lastPlayed;
  int games;
  int win;
  int withGames;
  int withWin;
  int againstGames;
  int againstWin;

  Heros({
    this.heroId,
    this.lastPlayed,
    this.games,
    this.win,
    this.withGames,
    this.withWin,
    this.againstGames,
    this.againstWin,
  });

  factory Heros.fromJson(Map<String, dynamic> json) => Heros(
        heroId: json["hero_id"],
        lastPlayed: json["last_played"],
        games: json["games"],
        win: json["win"],
        withGames: json["with_games"],
        withWin: json["with_win"],
        againstGames: json["against_games"],
        againstWin: json["against_win"],
      );

  Map<String, dynamic> toJson() => {
        "hero_id": heroId,
        "last_played": lastPlayed,
        "games": games,
        "win": win,
        "with_games": withGames,
        "with_win": withWin,
        "against_games": againstGames,
        "against_win": againstWin,
      };
}

class Counts {
  GameMode leaverStatus;
  GameMode gameMode;
  GameMode lobbyType;
  GameMode laneRole;
  GameMode region;
  GameMode patch;

  Counts({
    this.leaverStatus,
    this.gameMode,
    this.lobbyType,
    this.laneRole,
    this.region,
    this.patch,
  });

  factory Counts.fromJson(Map<String, dynamic> json) => Counts(
        leaverStatus: GameMode.fromJson(json["leaver_status"]),
        gameMode: GameMode.fromJson(json["game_mode"]),
        lobbyType: GameMode.fromJson(json["lobby_type"]),
        laneRole: GameMode.fromJson(json["lane_role"]),
        region: GameMode.fromJson(json["region"]),
        patch: GameMode.fromJson(json["patch"]),
      );

  Map<String, dynamic> toJson() => {
        "leaver_status": leaverStatus.toJson(),
        "game_mode": gameMode.toJson(),
        "lobby_type": lobbyType.toJson(),
        "lane_role": laneRole.toJson(),
        "region": region.toJson(),
        "patch": patch.toJson(),
      };
}

class GameMode {
  int games;
  int win;

  GameMode({
    this.games,
    this.win,
  });

  factory GameMode.fromJson(Map<String, dynamic> json) => GameMode(
        games: json["games"],
        win: json["win"],
      );

  Map<String, dynamic> toJson() => {
        "games": games,
        "win": win,
      };
}
