import 'package:flutter/material.dart';
import './StandardBoxShadow.dart';

class StreakListItem extends StatelessWidget {
  StreakListItem(this.title, this.index, {this.onLongPress, this.onTap});

  final String title;
  final int index;
  final ValueChanged<int> onTap;
  final ValueChanged<int> onLongPress;

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.all(10.0),
        width: MediaQuery.of(context).size.width,
        decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.all(new Radius.circular(2.0)),
            boxShadow: [standardBoxShadow()]),
        child: new Material(
            color: Colors.transparent,
            child: new InkWell(
                onTap: () {
                  onTap(index);
                },
                onLongPress: () {
                  onLongPress(index);
                },
                borderRadius: new BorderRadius.all(new Radius.circular(2.0)),
                child: new Container(
                    padding: EdgeInsets.all(20.0),
                    child: new Text(
                      title,
                      style: new TextStyle(fontSize: 15.0),
                    )))));
  }
}
