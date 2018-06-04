import 'package:flutter/material.dart';

class ReturnButton extends StatelessWidget {
  ReturnButton({this.onPressed});

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return (new Container(
        alignment: Alignment.topLeft,
        child: new IconButton(
            onPressed: onPressed,
            iconSize: 28.0,
            color: Theme.of(context).accentColor,
            icon: new ImageIcon(new AssetImage('assets/icons/arrow.png')))));
  }
}
