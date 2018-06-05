import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle _label(Color color) {
    return new TextStyle(
        color: color, fontWeight: FontWeight.w700, fontSize: 20.0);
  }

  static TextStyle standardLabel() {
    return _label(Colors.black);
  }

  static TextStyle accentedLabel() {
    return _label(Colors.red);
  }

  static TextStyle header() {
    return new TextStyle(
        fontWeight: FontWeight.w700, fontSize: 34.0, color: Colors.black);
  }
}
