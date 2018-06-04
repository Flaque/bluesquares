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
    return new Table(children: new List.generate(MAX_WEEKS_IN_A_MONTH, row));
  }

  TableRow row(index) {
    return new TableRow(children: new List.generate(DAYS_IN_A_WEEK, block));
  }

  Widget block(index) {
    return new Expanded(child: new Placeholder());
  }
}
