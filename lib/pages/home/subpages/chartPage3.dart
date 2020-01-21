import 'package:dota2/models/data_object.dart';
import 'package:dota2/models/dota_model.dart';
import 'package:dota2/models/heros.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartPage3 extends StatelessWidget {
  final Streak streak;
  final List<DotaHero> heroes;

  ChartPage3({this.streak, this.heroes});

  String getName(int id) {
    return heroes.firstWhere((h) => h.id == id).localizedName;
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
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "过去比赛之连赢\n${streak.winStreaks.length}把",
                style: shadowStyle.copyWith(color: Colors.white, fontSize: 40),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: DataTable(
                    columnSpacing: 10,
                    columns: [
                      DataColumn(label: Text("Match ID")),
                      DataColumn(label: Text("Hero")),
                      DataColumn(label: Text("K/D/A")),
                      DataColumn(label: Text("Duration"))
                    ],
                    rows: streak.winStreaks
                        .map(
                          (PlayerMatches match) => DataRow(cells: [
                            DataCell(
                              Text(
                                "${match.matchId}",
                              ),
                            ),
                            DataCell(
                              Text(
                                getName(match.heroId),
                              ),
                            ),
                            DataCell(
                              Text(
                                  "${match.kills}/${match.deaths}/${match.assists}"),
                            ),
                            DataCell(
                              Text(
                                "${(match.duration / 60).floor()}:${(match.duration % 60)}",
                              ),
                            ),
                          ]),
                        )
                        .toList(),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
