import 'package:flutter/material.dart';
import './FixedSideLayout.dart';
import './TextStyles.dart';

class TodayButton extends StatelessWidget {
  TodayButton({this.onPressed, this.amountToday});

  final VoidCallback onPressed;
  final int amountToday;

  @override
  Widget build(BuildContext context) {
    return new FixedSideLayout(
        new Today(),
        new StreakButton(
          onPressed: onPressed,
          amountToday: amountToday,
        ));
  }
}

class StreakButton extends StatelessWidget {
  static const HEIGHT = 88.0;

  const StreakButton({
    this.onPressed,
    this.amountToday,
    Key key,
  }) : super(key: key);

  final VoidCallback onPressed;
  final int amountToday;

  @override
  Widget build(BuildContext context) {
    return new Container(
        height: HEIGHT,
        child: new RaisedButton(
            color: Theme.of(context).accentColor,
            onPressed: onPressed,
            child: new Text(this.amountToday.toString(),
                style: TextStyles.whiteLabel())));
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
