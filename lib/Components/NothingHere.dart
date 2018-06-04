import 'package:flutter/material.dart';

class NothingHere extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (new Container(
        alignment: Alignment.center,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("No streaks yet 🙁", style: new TextStyle(fontSize: 20.0)),
            new Padding(
                padding: new EdgeInsets.all(30.0),
                child: new Image.asset(
                  "assets/icons/transparent_logo.png",
                  height: 100.0,
                )),
            new Text("Tap the '+' icon to get started.",
                style: new TextStyle(fontWeight: FontWeight.w300))
          ],
        )));
  }
}
