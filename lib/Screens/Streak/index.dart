import 'package:flutter/material.dart';

import '../../Components/TodayButton.dart';
import '../../Components/EditableHeader.dart';

class StreakScreen extends StatefulWidget {
  StreakScreen({Key key, this.data}) : super(key: key);

  final String data;

  @override
  _StreakScreenState createState() => new _StreakScreenState();
}

class _StreakScreenState extends State<StreakScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        margin: const EdgeInsets.all(20.0),
        child: new ListView(
          children: <Widget>[
            new EditableHeader(widget.data),
            new TodayButton()
          ],
        ),
      ),
    );
  }
}