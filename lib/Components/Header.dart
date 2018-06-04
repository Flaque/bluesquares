import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  Header(this.title);
  final String title;
  @override
  Widget build(BuildContext context) {
    return new Text(title,
        style: new TextStyle(
            fontWeight: FontWeight.w700, fontSize: 34.0, color: Colors.black));
  }
}
