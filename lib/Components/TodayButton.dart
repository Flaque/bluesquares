import 'package:flutter/material.dart';

class TodayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Row(children: <Widget>[
      new Text('Today',
          textAlign: TextAlign.left,
          style: new TextStyle(color: Colors.redAccent, fontSize: 24.0))
    ]);
  }
}
