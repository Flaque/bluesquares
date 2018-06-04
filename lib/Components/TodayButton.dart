import 'package:flutter/material.dart';
import './FixedSideLayout.dart';

class TodayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new FixedSideLayout(
        new Today(), new StreakButton(), StreakButton.HEIGHT);
  }
}

class StreakButton extends StatelessWidget {
  static const HEIGHT = 88.0;

  const StreakButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
        height: HEIGHT,
        child: new RaisedButton(
          color: Colors.blue,
          onPressed: () => {},
        ));
  }
}

class Today extends StatelessWidget {
  const Today({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Text('Today',
        textAlign: TextAlign.start,
        style: new TextStyle(
            color: Colors.redAccent,
            fontWeight: FontWeight.w700,
            fontSize: 20.0));
  }
}
