import 'package:flutter/material.dart';

BoxShadow standardBoxShadow() {
  Color black = new Color.fromARGB(
      20, Colors.black12.red, Colors.black12.green, Colors.black12.blue);

  return new BoxShadow(
      offset: new Offset(0.0, 2.0), color: black, blurRadius: 8.0);
}
