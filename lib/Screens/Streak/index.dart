import 'package:flutter/material.dart';

import '../../Components/TodayButton.dart';
import '../../Components/EditableHeader.dart';
import '../../Components/Heatmap.dart';
import '../../Models/Streak.dart';
import '../../Models/UserData.dart';
import '../../Components/FixedSideLayout.dart';
import '../../Components/TextStyles.dart';

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
            margin: const EdgeInsets.all(24.0), child: buildListView()));
  }

  ListView buildListView() {
    return new ListView(
      children: <Widget>[
        new EditableHeader(widget.streak.title, onChanged: updateTitle),
        new TodayButton(),
        new MonthHeatmap("June"),
      ],
    );
  }
}

class MonthHeatmap extends StatelessWidget {
  final String month;

  const MonthHeatmap(this.month);

  @override
  Widget build(BuildContext context) {
    return new FixedSideLayout(
        new Text(month,
            textAlign: TextAlign.start, style: TextStyles.standardLabel()),
        new Container(height: 180.0, child: Heatmap()),
        180.0);
  }
}
