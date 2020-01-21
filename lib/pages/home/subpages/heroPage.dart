import 'package:dota2/models/data_object.dart';
import 'package:dota2/models/dota_model.dart';
import 'package:dota2/models/heros.dart';
import 'package:flutter/material.dart';

class HeroPage extends StatelessWidget {
  final List<Heros> playedHeroes;
  final List<DotaHero> heroes;

  HeroPage({@required this.heroes, @required this.playedHeroes});

  Heros _mostPlayedHero() {
    return playedHeroes.first;
  }

  Heros _highestWinRateHero() {
    double maxWinRate = playedHeroes[0].win / playedHeroes[0].games;
    int numOfPlayed = playedHeroes[0].games;
    Heros ret = playedHeroes[0];
    for (Heros hero in playedHeroes) {
      double rate = hero.win / hero.games;
      if (rate > maxWinRate && hero.games > 10) {
        maxWinRate = rate;
        numOfPlayed = hero.games;
        ret = hero;
      } else {
        if (hero.games > numOfPlayed && rate > 0.5) {
          maxWinRate = rate;
          numOfPlayed = hero.games;
          ret = hero;
        }
      }
    }
    return ret;
  }

  Heros _lowestWinRateHero() {
    double minWinRate = 100;
    int numOfPlayed = -1;
    Heros ret;
    for (Heros hero in playedHeroes) {
      double rate = hero.win / hero.games;
      if (rate < minWinRate) {
        minWinRate = rate;
        numOfPlayed = hero.games;
        ret = hero;
      }
      if (rate == minWinRate) {
        if (hero.games > numOfPlayed) {
          minWinRate = rate;
          numOfPlayed = hero.games;
          ret = hero;
        }
      }
    }
    return ret;
  }

  DotaHero getDotaHero(Heros hero) {
    return heroes.firstWhere((h) => h.id == int.parse(hero.heroId),
        orElse: () => null);
  }

  @override
  Widget build(BuildContext context) {
    Heros mostPlayedHero = _mostPlayedHero();
    Heros highestWinRateHero = _highestWinRateHero();
    Heros lowestWinRateHero = _lowestWinRateHero();

    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/backgrounds/bg8.jpg",
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Center(
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "绝活${getDotaHero(highestWinRateHero).localizedName}王",
                  style:
                      shadowStyle.copyWith(color: Colors.yellow, fontSize: 50),
                ),
                buildMostPlayed(mostPlayedHero),
                buildHighestWinRate(highestWinRateHero, mostPlayedHero),
                buildLowestWinRatePlayed(lowestWinRateHero),
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

  Column buildHighestWinRate(Heros highestWinRateHero, Heros mostPlayedHero) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 100,
          width: 100,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                  "assets/heros/${DotaModel.getImageName(getDotaHero(highestWinRateHero).name)}"),
            ),
          ),
        ),
        RichText(
          text: TextSpan(children: [
            mostPlayedHero != highestWinRateHero
                ? TextSpan(
                    text: "然而事实上你的本命英雄是 ",
                    style: shadowStyle,
                  )
                : TextSpan(
                    text: "然而事实上你的本命英雄",
                    style: shadowStyle,
                  ),
            mostPlayedHero != highestWinRateHero
                ? TextSpan(text: "")
                : TextSpan(
                    text: "还真是",
                    style:
                        shadowStyle.copyWith(fontSize: 40, color: Colors.green),
                  ),
            TextSpan(
              text: "${getDotaHero(highestWinRateHero).localizedName} ",
              style: shadowStyle.copyWith(color: Colors.blue, fontSize: 30),
            ),
            TextSpan(
              text: "因为你在过去玩了他 ",
              style: shadowStyle,
            ),
            TextSpan(
                text: "${highestWinRateHero.games} ",
                style: shadowStyle.copyWith(color: Colors.red, fontSize: 30)),
            TextSpan(text: "把。", style: shadowStyle),
            TextSpan(
              text: "而你胜利了 ",
              style: shadowStyle,
            ),
            TextSpan(
                text: "${highestWinRateHero.win} ",
                style: shadowStyle.copyWith(color: Colors.red, fontSize: 30)),
            TextSpan(text: "把比赛。", style: shadowStyle)
          ]),
        )
      ],
    );
  }

  Column buildMostPlayed(Heros mostPlayedHero) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 100,
          width: 100,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                  "assets/heros/${DotaModel.getImageName(getDotaHero(mostPlayedHero).name)}"),
            ),
          ),
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: "你以为你很擅长 ",
              style: shadowStyle,
            ),
            TextSpan(
              text: "${getDotaHero(mostPlayedHero).localizedName} ",
              style: shadowStyle.copyWith(color: Colors.yellow, fontSize: 30),
            ),
            TextSpan(
              text: "因为在过去的比赛中你一共玩了 ",
              style: shadowStyle,
            ),
            TextSpan(
                text: "${mostPlayedHero.games} ",
                style: shadowStyle.copyWith(color: Colors.red, fontSize: 30)),
            TextSpan(text: "把这个英雄。", style: shadowStyle),
          ]),
        )
      ],
    );
  }

  Column buildLowestWinRatePlayed(Heros lowestWinRateHero) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 100,
          width: 100,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                  "assets/heros/${DotaModel.getImageName(getDotaHero(lowestWinRateHero).name)}"),
            ),
          ),
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: "当然你的 ",
              style: shadowStyle,
            ),
            TextSpan(
              text: "${getDotaHero(lowestWinRateHero).localizedName} ",
              style: shadowStyle.copyWith(color: Colors.orange, fontSize: 30),
            ),
            TextSpan(
              text: "实在是太翔哥了。过去的 ",
              style: shadowStyle,
            ),
            TextSpan(
                text: "${lowestWinRateHero.games} ",
                style: shadowStyle.copyWith(color: Colors.red, fontSize: 30)),
            TextSpan(
              text: "场比赛你只赢了 ",
              style: shadowStyle,
            ),
            TextSpan(
                text: "${lowestWinRateHero.win} ",
                style: shadowStyle.copyWith(color: Colors.red, fontSize: 30)),
            TextSpan(text: "场。", style: shadowStyle)
          ]),
        )
      ],
    );
  }
}
