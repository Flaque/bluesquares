import 'package:flutter/material.dart';

// Creates a layout with a "fixed" and "expanded"
// where the left is a fixed width and the right expands
//
// Example:
// xyz | fooooo
// zs  | fooerooo
// dog | catts
// d   | wi
//
class FixedSideLayout extends StatelessWidget {
  static const FIXED_WIDTH = 88.0;

  final Widget fixed, expanded;

  FixedSideLayout(this.fixed, this.expanded);

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: new EdgeInsets.only(bottom: 24.0),
        child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                  width: FIXED_WIDTH,
                  alignment: Alignment.topLeft,
                  child: new Container(
                      alignment: Alignment.topLeft, child: this.fixed)),
              new Expanded(child: this.expanded)
            ]));
  }
}
