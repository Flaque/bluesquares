import 'package:flutter/material.dart';
import '../Models/Days.dart';

const DAYS_IN_A_WEEK = 7; // Gee I hope this doesnt change
const MAX_DAYS_IN_A_MONTH = 31;
const MAX_WEEKS_IN_A_MONTH = 5;

Color heatColor(amount) {
  if (amount > 15) {
    return new Color(0xff0c2461);
  }

  if (amount > 10) {
    return new Color(0xff1e3799);
  }

  if (amount > 5) {
    return new Color(0xff4a69bd);
  }

  return new Color(0xff6a89cc);
}

class Heatmap extends StatefulWidget {
  @override
  _HeatmapState createState() => new _HeatmapState(<Day>[
        new Day(new DateTime(2018, DateTime.june, 1), 303),
        new Day(new DateTime(2018, DateTime.june, 2), 5),
        new Day(new DateTime(2018, DateTime.june, 3), 0),
        new Day(new DateTime(2018, DateTime.june, 4), 8),
        new Day(new DateTime(2018, DateTime.june, 5), 0),
        new Day(new DateTime(2018, DateTime.june, 6), 0),
        new Day(new DateTime(2018, DateTime.june, 7), 0),
        new Day(new DateTime(2018, DateTime.june, 8), 3),
        new Day(new DateTime(2018, DateTime.june, 9), 12),
        new Day(new DateTime(2018, DateTime.june, 10), 40),
        new Day(new DateTime(2018, DateTime.june, 11), 13),
        new Day(new DateTime(2018, DateTime.june, 12), 13),
        new Day(new DateTime(2018, DateTime.june, 13), 13),
        new Day(new DateTime(2018, DateTime.june, 14), 13),
      ]);
}

class _HeatmapState extends State<Heatmap> {
  static const BASE_PADDING = 5.0;
  List<Day> days;

  _HeatmapState(this.days);

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Center(
            child: new Column(
                children: new List.generate(
                    MAX_WEEKS_IN_A_MONTH, (week) => row(week)))));
  }

  Row row(week) {
    return new Row(
        children: new List.generate(DAYS_IN_A_WEEK, (day) => block(day, week)));
  }

  Widget block(day, week) {
    BoxDecoration boxDecoration = calcBoxDecoration(0);
    int dayNum = (week * 7) + (day);

    if (dayNum < this.days.length) {
      boxDecoration = calcBoxDecoration(this.days[dayNum].amount);
    }

    return new Expanded(
      child: new Container(
          height: 25.0,
          margin: new EdgeInsets.all(BASE_PADDING),
          decoration: boxDecoration),
    );
  }

  BoxDecoration calcBoxDecoration(amount) {
    if (amount <= 0) {
      return new BoxDecoration(
          borderRadius: new BorderRadius.all(new Radius.circular(2.0)),
          border: new Border.all(color: heatColor(amount), width: 4.0));
    }

    return new BoxDecoration(
        borderRadius: new BorderRadius.all(new Radius.circular(2.0)),
        color: heatColor(amount));
  }
}
