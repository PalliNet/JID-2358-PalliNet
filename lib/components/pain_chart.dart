import 'dart:html';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../firestore/firestore.dart';
import '../models/session_manager.dart';

class PainChart extends StatefulWidget {
  const PainChart({super.key});

  @override
  State<PainChart> createState() => _PainChart();
}

List<LineChartBarData> getChartData(List<dynamic> list, int length) {
  List<dynamic> colors = [
    Colors.pink,
    Colors.red,
    Colors.orange,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
    Colors.black
  ];
  // debugPrint(list.toString());
  list.sort(
      (a, b) => a["timestamp"].toDate().compareTo(b["timestamp"].toDate()));

  List<LineChartBarData> out = [];
  Map<DateTime, int> temp = {};
  debugPrint("start");
  for (var i = 0; i < length; i++) {
    for (var j = 0; j < list.length; j++) {
      // debugPrint(temp.toString());

      DateTime d = list[j]["timestamp"].toDate();
      d.millisecondsSinceEpoch;
      temp[d] = list[j]["q$i"];
    }
    debugPrint(temp.toString());

    out.add(LineChartBarData(
        color: colors[i],
        spots: temp.entries.map((e) {
          return FlSpot(
              e.key.millisecondsSinceEpoch as double, e.value as double);
        }).toList()));
  }
  return out;
}

class _PainChart extends State<PainChart> {
  late final SessionManager _prefs;

  @override
  void initState() {
    _prefs = SessionManager();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>?>(
        future: _prefs.getUid().then((uid) => retrieveEntries(uid)),
        builder: ((context, snapshot) {
          if (snapshot.data == null) {
            return const SizedBox.shrink();
          }

          final list = snapshot.data as List;
          if (list.length == 0) {
            return const SizedBox.shrink();
          }
          debugPrint(list.toString());
          debugPrint(list[0]["timestamp"].runtimeType.toString());
          return Scaffold(
            appBar: AppBar(title: Text("Pain Chart")),
            body: Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: LineChart(LineChartData(
                    // minX: 0, maxX: 10, minY: 0, maxY: 10,

                    titlesData: title(),
                    // lineTouchData: LineTouchTooltipData(getTooltipItems: (value) => LineTooltipItem(value.y) as List<LineTooltipItem>),
                    lineBarsData: getChartData(list, list[0].length - 1)))),
          );
        }));
  }
}

FlTitlesData title() {
  return FlTitlesData(
      show: true,
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      leftTitles: AxisTitles(
          sideTitles: SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          if (value.runtimeType == int) {
            return Text(style: TextStyle(fontSize: 18), value.toString());
          }
          return SizedBox.shrink();
        },
      )),
      bottomTitles: AxisTitles(
          sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 70,
              getTitlesWidget: ((value, meta) {
                DateTime date =
                    DateTime.fromMillisecondsSinceEpoch(value as int);
                date.toString();
                String label =
                    "${date.year}-${date.month}-${date.day} ${date.hour}:${date.minute}";

                return Text(style: TextStyle(fontSize: 14), label);
              }),
              interval: Duration.millisecondsPerDay / 2 as double)));
}

String _twoDigits(int n) {
  if (n >= 10) return "${n}";
  return "0${n}";
}
