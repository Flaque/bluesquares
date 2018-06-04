import 'package:flutter/material.dart';

import 'ReturnButton.dart';

class Header extends StatelessWidget {
  final String data;

  Header(this.data);

  @override
  Widget build(BuildContext context) {
    return new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Navigator.canPop(context)
              ? new ReturnButton(onPressed: () {
                  Navigator.pop(context);
                })
              : new Container(),
          new Container(
              margin: const EdgeInsetsDirectional.only(bottom: 24.0),
              child: new Text(
                this.data,
                textAlign: TextAlign.left,
                style:
                    new TextStyle(fontWeight: FontWeight.w900, fontSize: 34.0),
              ))
        ]);
  }
}
