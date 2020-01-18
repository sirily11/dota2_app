import 'dart:io';

import 'package:dota2/models/data_object.dart';
import 'package:dota2/models/dota_model.dart';
import 'package:dota2/models/heros.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HeroPage2 extends StatelessWidget {
  final List<Heros> playedHeroes;
  final List<DotaHero> heroes;

  HeroPage2({@required this.heroes, @required this.playedHeroes});

  DotaHero getDotaHero(Heros hero) {
    return heroes.firstWhere((h) => h.id == int.parse(hero.heroId),
        orElse: () => null);
  }

  List<String> getNames() {
    return playedHeroes.map((h) => getDotaHero(h).name).toList();
  }

  bool hasPlayed(Heros hero) {
    return hero.games > 0;
  }

  int totalPlayedHero() {
    return playedHeroes.where((h) => hasPlayed(h)).toList().length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> names = getNames();
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/backgrounds/bg3.jpg",
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "英雄池 ",
                      style: shadowStyle.copyWith(fontSize: 30),
                    ),
                    TextSpan(
                      text: "${totalPlayedHero()}/${playedHeroes.length}",
                      style: shadowStyle.copyWith(fontSize: 30),
                    ),
                  ]),
                ),
                Text(
                  "(灰色意味着你连碰都没碰过)",
                  style:
                      shadowStyle.copyWith(color: Colors.white, fontSize: 15),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                    ),
                    itemCount: playedHeroes.length,
                    itemBuilder: (context, index) {
                      Heros hero = playedHeroes[index];
                      if (hasPlayed(hero)) {
                        return Image.asset(
                          "assets/heros/${DotaModel.getImageName(names[index])}",
                          fit: BoxFit.cover,
                        );
                      } else {
                        if (kIsWeb) {
                          return Container();
                        }
                        return ColorFiltered(
                          colorFilter:
                              ColorFilter.mode(Colors.grey, BlendMode.color),
                          child: Image.asset(
                            "assets/heros/${DotaModel.getImageName(names[index])}",
                            fit: BoxFit.cover,
                            height: 100,
                          ),
                        );
                      }
                    },
                  ),
                )
              ],
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
}
