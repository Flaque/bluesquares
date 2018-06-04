import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String data;

  Header(this.data);

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: const EdgeInsetsDirectional.only(bottom: 24.0),
        child: new Text(
          this.data,
          textAlign: TextAlign.left,
          style: new TextStyle(fontWeight: FontWeight.w900, fontSize: 34.0),
        ));
  }
}
