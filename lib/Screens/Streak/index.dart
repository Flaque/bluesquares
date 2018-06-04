import 'package:flutter/material.dart';

import '../../Components/TodayButton.dart';
import '../../Components/EditableHeader.dart';
import '../../Models/Streak.dart';
import '../../Models/UserData.dart';

class StreakScreen extends StatefulWidget {
  StreakScreen({Key key, this.streak}) : super(key: key);

  final Streak streak;

  @override
  _StreakScreenState createState() => new _StreakScreenState();
}

class _StreakScreenState extends State<StreakScreen> {
  void updateTitle(String value) {
    widget.streak.title = value;
    UserData.update(widget.streak);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        margin: const EdgeInsets.all(20.0),
        child: new ListView(
          children: <Widget>[
            new EditableHeader(widget.streak.title, onChanged: updateTitle),
            new TodayButton()
          ],
        ),
      ),
    );
  }
}
