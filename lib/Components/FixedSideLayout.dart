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

  final double height;
  final Widget fixed, expanded;

  FixedSideLayout(this.fixed, this.expanded, this.height);

  @override
  Widget build(BuildContext context) {
    return new Row(children: <Widget>[
      new Container(
          width: FIXED_WIDTH,
          alignment: Alignment.topLeft,
          child: new Container(
              alignment: Alignment.topLeft,
              height: this.height,
              child: this.fixed)),
      new Expanded(child: this.expanded)
    ]);
  }
}
