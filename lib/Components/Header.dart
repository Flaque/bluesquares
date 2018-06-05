import 'package:flutter/material.dart';
import "./TextStyles.dart";

class Header extends StatelessWidget {
  Header(this.title);
  final String title;
  @override
  Widget build(BuildContext context) {
    return new Text(title, style: TextStyles.header());
  }
}
