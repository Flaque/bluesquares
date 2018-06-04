import 'package:flutter/material.dart';

class TodayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Row(children: <Widget>[
      new Container(
        width: 88.0,
        child: new Text('Today',
            textAlign: TextAlign.left,
            style: new TextStyle(color: Colors.redAccent, fontSize: 24.0)),
      ),
      new Expanded(
          child: new RaisedButton(
        color: Colors.blue,
        onPressed: () => {},
      ))
    ]);
  }
}
