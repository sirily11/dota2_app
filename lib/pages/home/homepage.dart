import 'package:dota2/models/data_object.dart';
import 'package:dota2/models/dota_model.dart';
import 'package:dota2/pages/home/subpages/chartPage.dart';
import 'package:dota2/pages/home/subpages/heroPage.dart';
import 'package:dota2/pages/home/subpages/userinfo.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:provider/provider.dart';

import 'subpages/heroPage2.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController controller = PageController(initialPage: 0);

  @override
  void initState() {
    Future.delayed(
        Duration(
          milliseconds: 40,
        ), () async {
      DotaModel model = Provider.of(context, listen: false);
      await model.getAll();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DotaModel model = Provider.of(context);
    if (!model.isReady) {
      return Scaffold(
        body: Center(
          child: JumpingText("Loading..."),
        ),
      );
    }

    if (model.error != null) {
      return Scaffold(
        body: Center(
          child: Text(model.error),
        ),
      );
    }

    return Scaffold(
      body: PageView(
        controller: controller,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          UserInfoPage(
            player: model.player,
            recentMatches: model.recentMatches,
            winLose: model.winLose,
          ),
          HeroPage(
            heroes: model.heroes,
            playedHeroes: model.playedHeroes,
          ),
          HeroPage2(
            heroes: model.heroes,
            playedHeroes: model.playedHeroes,
          ),
          ChartPage(
            longestMatch: model.longestPlay.duration,
            shortestMatch: model.shortestPlay.duration,
          )
        ],
      ),
    );
  }
}
