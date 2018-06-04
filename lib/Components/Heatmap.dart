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
    return new Container(
        margin: new EdgeInsets.only(top: 24.0),
        child: new Center(
            child: new Column(
                children: new List.generate(
                    MAX_WEEKS_IN_A_MONTH, (index) => row(index, context)))));
  }

  Row row(index, context) {
    return new Row(
        children: new List.generate(
            DAYS_IN_A_WEEK, (index) => block(index, DAYS_IN_A_WEEK, context)));
  }

  Widget block(index, length, context) {
    const BASE_PADDING = 5.0;
    return new Expanded(
      child: new Container(
          height: 30.0,
          margin: new EdgeInsets.all(BASE_PADDING),
          decoration: new BoxDecoration(color: Colors.blue)),
    );
  }
}
