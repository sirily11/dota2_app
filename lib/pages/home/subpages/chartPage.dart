import 'package:dota2/models/dota_model.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class HistoryData {
  final String label;
  final int data;

  HistoryData({this.data, this.label});
}

class ChartPage extends StatelessWidget {
  final int longestMatch;
  final int shortestMatch;

  ChartPage({this.longestMatch, this.shortestMatch});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/backgrounds/bg4.jpg",
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "过去比赛之最（秒）",
              style: shadowStyle.copyWith(color: Colors.white, fontSize: 40),
            ),
            Container(
              height: 400,
              child: Card(
                child: charts.BarChart([
                  charts.Series<HistoryData, String>(
                      id: "Data",
                      data: [
                        HistoryData(label: "最长的比赛", data: longestMatch),
                        HistoryData(label: "最短的比赛", data: shortestMatch)
                      ],
                      domainFn: (HistoryData data, _) => data.label,
                      measureFn: (HistoryData data, _) => data.data)
                ]),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
