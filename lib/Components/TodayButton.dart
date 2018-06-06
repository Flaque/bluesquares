import 'package:flutter/material.dart';
import './FixedSideLayout.dart';

class TodayButton extends StatelessWidget {
  TodayButton({this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return new FixedSideLayout(
        new Today(), new StreakButton(onPressed: onPressed));
  }
}

class StreakButton extends StatelessWidget {
  static const HEIGHT = 88.0;

  const StreakButton({
    this.onPressed,
    Key key,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return new Container(
        height: HEIGHT,
        child: new RaisedButton(
          color: Theme.of(context).accentColor,
          onPressed: onPressed,
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
