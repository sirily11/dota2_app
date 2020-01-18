import 'package:dota2/models/data_object.dart';
import 'package:dota2/models/dota_model.dart';
import 'package:flutter/material.dart';

class UserInfoPage extends StatelessWidget {
  final Player player;
  final WinLose winLose;
  final List<RecentMatch> recentMatches;

  UserInfoPage(
      {@required this.player,
      @required this.winLose,
      @required this.recentMatches});

  double _getRecentWinRate() {
    int totalNum = recentMatches.length;
    int winNum = recentMatches
        .where((match) =>
            (match.playerSlot <= 127 && match.radiantWin) ||
            (match.playerSlot > 127 && !match.radiantWin))
        .length;
    return (winNum / totalNum) * 100;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/backgrounds/bg8.jpg",
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[buildName(), buildBody()],
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text(
              "Slide for more",
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  RichText buildBody() {
    return RichText(
      text: TextSpan(children: [
        TextSpan(text: "你在过去的365天里玩了 ", style: shadowStyle),
        TextSpan(
          text: "${winLose.win + winLose.lose} ",
          style: shadowStyle.copyWith(color: Colors.red, fontSize: 30),
        ),
        TextSpan(text: "场比赛。", style: shadowStyle),
        TextSpan(text: "之后你的胜率是", style: shadowStyle),
        TextSpan(
          text:
              "${((winLose.win / (winLose.lose + winLose.win)) * 100).toStringAsFixed(2)}%. ",
          style: shadowStyle.copyWith(color: Colors.yellow, fontSize: 30),
        ),
        TextSpan(text: "然而最近的几场比赛你的胜率是 ", style: shadowStyle),
        TextSpan(
          text: "${_getRecentWinRate().toStringAsFixed(2)}%. ",
          style: shadowStyle.copyWith(color: Colors.orange, fontSize: 30),
        )
      ]),
    );
  }

  Widget buildName() {
    return Wrap(
      children: <Widget>[
        Image.network(player.profile.avatarmedium),
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: "亲爱的 ",
                style: shadowStyle.copyWith(color: Colors.red, fontSize: 30)),
            TextSpan(
              text: "${player.profile.personaname}",
              style: shadowStyle.copyWith(fontSize: 24),
            )
          ]),
        )
      ],
    );
  }
}
