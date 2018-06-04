import 'package:flutter/material.dart';

import 'EditableTitle.dart';
import 'ReturnButton.dart';

class EditableHeader extends StatelessWidget {
  EditableHeader(this.data);
  final String data;

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
          new EditableTitle(data: data, onChanged: (value) {})
        ]);
  }
}
