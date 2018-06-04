import 'package:flutter/material.dart';

const HEIGHT = 88.0;
const TEXT_WIDTH = 88.0;

class TodayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Row(children: <Widget>[
      new Container(
        width: TEXT_WIDTH,
        alignment: Alignment.topLeft,
        child: new Container(
            alignment: Alignment.topLeft,
            height: HEIGHT,
            child: new Text('Today',
                textAlign: TextAlign.start,
                style: new TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0))),
      ),
      new Expanded(
          child: new Container(
              height: HEIGHT,
              child: new RaisedButton(
                color: Colors.blue,
                onPressed: () => {},
              )))
    ]);
  }
}
