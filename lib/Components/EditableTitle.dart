import 'package:flutter/material.dart';

class EditableTitle extends StatelessWidget {
  EditableTitle({this.data = "", this.onChanged});
  final ValueChanged<String> onChanged;
  final String data;
  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: const EdgeInsetsDirectional.only(bottom: 24.0),
        child: TextFormField(
            decoration: new InputDecoration(
                border: InputBorder.none,
                hintText: "Title",
                hintStyle: new TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 34.0,
                    color: Colors.black54)),
            initialValue: data,
            autofocus: data.isEmpty,
            onFieldSubmitted: onChanged,
            textAlign: TextAlign.left,
            style: new TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 34.0,
                color: Colors.black)));
  }
}
