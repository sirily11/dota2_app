import 'package:dota2/models/data_object.dart';
import 'package:dota2/models/dota_model.dart';
import 'package:dota2/pages/home/subpages/chartPage.dart';
import 'package:dota2/pages/home/subpages/chartPage2.dart';
import 'package:dota2/pages/home/subpages/chartPage3.dart';
import 'package:dota2/pages/home/subpages/heroPage.dart';
import 'package:dota2/pages/home/subpages/ranking.dart';
import 'package:dota2/pages/home/subpages/userinfo.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:provider/provider.dart';
import 'package:transformer_page_view/transformer_page_view.dart';
import 'dart:math' as Math;

import 'subpages/heroPage2.dart';

class AccordionTransformer extends PageTransformer {
  @override
  Widget transform(Widget child, TransformInfo info) {
    double position = info.position;
    if (position < 0.0) {
      return new Transform.scale(
        scale: 1 + position,
        alignment: Alignment.topRight,
        child: child,
      );
    } else {
      return new Transform.scale(
        scale: 1 - position,
        alignment: Alignment.bottomLeft,
        child: child,
      );
    }
  }
}

class ScaleAndFadeTransformer extends PageTransformer {
  final double _scale;
  final double _fade;

  ScaleAndFadeTransformer({double fade: 0.3, double scale: 0.8})
      : _fade = fade,
        _scale = scale;

  @override
  Widget transform(Widget item, TransformInfo info) {
    double position = info.position;
    double scaleFactor = (1 - position.abs()) * (1 - _scale);
    double fadeFactor = (1 - position.abs()) * (1 - _fade);
    double opacity = _fade + fadeFactor;
    double scale = _scale + scaleFactor;
    return new Opacity(
      opacity: opacity,
      child: new Transform.scale(
        scale: scale,
        child: item,
      ),
    );
  }
}

class ZoomInPageTransformer extends PageTransformer {
  static const double ZOOM_MAX = 0.5;
  @override
  Widget transform(Widget child, TransformInfo info) {
    double position = info.position;
    double width = info.width;
    if (position > 0 && position <= 1) {
      return new Transform.translate(
        offset: new Offset(-width * position, 0.0),
        child: new Transform.scale(
          scale: 1 - position,
          child: child,
        ),
      );
    }
    return child;
  }
}

class ZoomOutPageTransformer extends PageTransformer {
  static const double MIN_SCALE = 0.85;
  static const double MIN_ALPHA = 0.5;

  @override
  Widget transform(Widget child, TransformInfo info) {
    double position = info.position;
    double pageWidth = info.width;
    double pageHeight = info.height;

    if (position < -1) {
      // [-Infinity,-1)
      // This page is way off-screen to the left.
      //view.setAlpha(0);
    } else if (position <= 1) {
      // [-1,1]
      // Modify the default slide transition to
      // shrink the page as well
      double scaleFactor = Math.max(MIN_SCALE, 1 - position.abs());
      double vertMargin = pageHeight * (1 - scaleFactor) / 2;
      double horzMargin = pageWidth * (1 - scaleFactor) / 2;
      double dx;
      if (position < 0) {
        dx = (horzMargin - vertMargin / 2);
      } else {
        dx = (-horzMargin + vertMargin / 2);
      }
      // Scale the page down (between MIN_SCALE and 1)
      double opacity = MIN_ALPHA +
          (scaleFactor - MIN_SCALE) / (1 - MIN_SCALE) * (1 - MIN_ALPHA);

      return new Opacity(
        opacity: opacity,
        child: new Transform.translate(
          offset: new Offset(dx, 0.0),
          child: new Transform.scale(
            scale: scaleFactor,
            child: child,
          ),
        ),
      );
    } else {
      // (1,+Infinity]
      // This page is way off-screen to the right.
      // view.setAlpha(0);
    }

    return child;
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController controller = PageController(initialPage: 0);
  ValueNotifier<double> _notifier = ValueNotifier<double>(0);

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
        appBar: AppBar(),
        body: Center(
          child: JumpingText("Loading..."),
        ),
      );
    }

    if (model.error != null) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text(model.error),
        ),
      );
    }
    var views = [
      UserInfoPage(
        withinOneYear: model.withinOneYear,
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
      RankingPage(
        heroes: model.heroes,
        playedHeroes: model.playedHeroes,
      ),
      ChartPage(
        longestMatch: model.longestPlay,
        shortestMatch: model.shortestPlay,
        heroes: model.heroes,
      ),
      ChartPage2(
        heroes: model.heroes,
        streak: model.streak,
      ),
      ChartPage3(
        heroes: model.heroes,
        streak: model.streak,
      )
    ];
    return Scaffold(
      appBar: AppBar(),
      body: TransformerPageView(
        loop: false,
        itemCount: 7,
        transformer: ZoomOutPageTransformer(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return views[index];
        },
      ),
    );
  }
}
