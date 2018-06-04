import 'package:flutter/material.dart';

class BottomSheetDialog extends StatefulWidget {
  BottomSheetDialog(
      {this.title, this.primaryOption, this.secondaryOption, this.completed});
  final String title;
  final String primaryOption;
  final String secondaryOption;
  final ValueChanged<bool> completed;

  @override
  _BottomSheetDialogState createState() =>
      new _BottomSheetDialogState(title, primaryOption, secondaryOption);
}

class _BottomSheetDialogState extends State<BottomSheetDialog> {
  _BottomSheetDialogState(this.title, this.primaryOption, this.secondaryOption);

  final String title;
  final String primaryOption;
  final String secondaryOption;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 120.0,
      color: Colors.white,
      child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Text(
              title,
              style: new TextStyle(fontSize: 17.0),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new FlatButton(
                    onPressed: () {
                      widget.completed(false);
                    },
                    child: new Text(widget.secondaryOption,
                        style: new TextStyle(
                            color: Theme.of(context).accentColor))),
                new FlatButton(
                    onPressed: () {
                      widget.completed(true);
                    },
                    child: new Text(widget.primaryOption,
                        style: new TextStyle(color: Colors.red)))
              ],
            )
          ]),
    );
  }
}
