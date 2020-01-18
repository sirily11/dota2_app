import 'package:dota2/models/data_object.dart';
import 'package:dota2/models/dota_model.dart';
import 'package:dota2/models/heros.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RankingPage extends StatefulWidget {
  final List<Heros> playedHeroes;
  final List<DotaHero> heroes;

  RankingPage({@required this.heroes, @required this.playedHeroes});

  @override
  _RankingPageState createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  int number = 3;

  DotaHero getDotaHero(Heros hero) {
    return widget.heroes
        .firstWhere((h) => h.id == int.parse(hero.heroId), orElse: () => null);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/backgrounds/bg7.jpg",
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 60),
          child: Column(
            children: <Widget>[
              Text(
                "Rankings",
                style: TextStyle(fontSize: 30),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: DataTable(
                    columnSpacing: 20,
                    columns: [
                      DataColumn(
                          label: Text(
                        "",
                        style: shadowStyle,
                      )),
                      DataColumn(
                          label: Text(
                        "Name",
                        style: shadowStyle,
                      )),
                      DataColumn(label: Text("Wins", style: shadowStyle)),
                      DataColumn(label: Text("Loses", style: shadowStyle))
                    ],
                    rows: widget.playedHeroes
                        .sublist(0, number)
                        .map(
                          (hero) => DataRow(cells: [
                            DataCell(
                              Image.asset(
                                "assets/heros/${DotaModel.getImageName(getDotaHero(hero).name)}",
                                height: 30,
                                fit: BoxFit.cover,
                              ),
                            ),
                            DataCell(
                              Text(getDotaHero(hero).localizedName,
                                  style: shadowStyle),
                            ),
                            DataCell(
                                Text(hero.win.toString(), style: shadowStyle)),
                            DataCell(
                              Text("${hero.games - hero.win}",
                                  style: shadowStyle),
                            ),
                          ]),
                        )
                        .toList(),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      if (number > 0) {
                        setState(() {
                          number -= 1;
                        });
                      }
                    },
                    icon: Icon(Icons.remove),
                  ),
                  Text(
                    "$number",
                    style: shadowStyle,
                  ),
                  IconButton(
                    onPressed: () {
                      if (number < widget.playedHeroes.length) {
                        setState(() {
                          number += 1;
                        });
                      }
                    },
                    icon: Icon(Icons.add),
                  ),
                ],
              )
            ],
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
