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

class Heatmap extends StatelessWidget {
  static const BASE_PADDING = 5.0;
  final List<Day> days;

  Heatmap(this.days);

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Center(
            child: new Column(
                children: new List.generate(
                    1 + (this.days.length / 8).floor(), (week) => row(week)))));
  }

  Row row(week) {
    int amountOfDays =
        DAYS_IN_A_WEEK - ((DAYS_IN_A_WEEK * (week + 1)) - this.days.length);
    amountOfDays = amountOfDays.clamp(1, DAYS_IN_A_WEEK);

    List<Widget> dayBlocks =
        List.generate(amountOfDays, (day) => block(day, week));
    List<Widget> emptyBlocks =
        List.generate(DAYS_IN_A_WEEK - amountOfDays, (i) => emptyBlock());

    return new Row(children: new List.from(dayBlocks)..addAll(emptyBlocks));
  }

  Widget block(day, week) {
    BoxDecoration boxDecoration = calcBoxDecoration(0);
    int dayNum = (week * 7) + (day);

    if (dayNum < this.days.length) {
      boxDecoration =
          calcBoxDecoration(this.days[this.days.length - 1 - dayNum].amount);
    }

    return new Expanded(
        child: new Container(
            height: 25.0,
            margin: new EdgeInsets.all(BASE_PADDING),
            decoration: boxDecoration));
  }

  Widget emptyBlock() {
    return new Expanded(
        child: new Container(
            height: 25.0, margin: new EdgeInsets.all(BASE_PADDING)));
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
