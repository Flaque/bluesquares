import 'package:flutter/material.dart';

import 'EditableTitle.dart';
import 'ReturnButton.dart';

class EditableHeader extends StatelessWidget {
  EditableHeader(this.data, {this.onChanged});
  final String data;
  final ValueChanged<String> onChanged;

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
          new EditableTitle(data: data, onChanged: onChanged)
        ]);
  }
}
