import 'package:flutter/material.dart';

const DAYS_IN_A_WEEK = 7; // Gee I hope this doesnt change
const MAX_DAYS_IN_A_MONTH = 31;
const MAX_WEEKS_IN_A_MONTH = 5;

class Heatmap extends StatefulWidget {
  @override
  _HeatmapState createState() => new _HeatmapState(MAX_DAYS_IN_A_MONTH);
}

class _HeatmapState extends State<Heatmap> {
  int days;

  _HeatmapState(this.days);

  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        new Column(
            children: new List.generate(
                MAX_WEEKS_IN_A_MONTH, (index) => row(index, context)))
      ],
    );
  }

  Row row(index, context) {
    return new Row(
        children: new List.generate(
            DAYS_IN_A_WEEK, (index) => block(index, DAYS_IN_A_WEEK, context)));
  }

  Widget block(index, length, context) {
    // Maybe save and reference it since it is always the same
    double width = MediaQuery.of(context).size.width / length;
    return new Container(
      width: width,
      height: width,
      padding: new EdgeInsets.all(5.0),
      child: new Container(decoration: new BoxDecoration(color: Colors.blue)),
    );
  }
}
