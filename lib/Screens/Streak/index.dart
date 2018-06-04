import 'package:flutter/material.dart';

import '../../Components/TodayButton.dart';
import '../../Components/EditableHeader.dart';
import '../../Components/Heatmap.dart';

class StreakScreen extends StatefulWidget {
  StreakScreen({Key key, this.data}) : super(key: key);

  final String data;

  @override
  _StreakScreenState createState() => new _StreakScreenState();
}

class _StreakScreenState extends State<StreakScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: new Heatmap());
  }
}
