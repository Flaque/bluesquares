import 'package:flutter/material.dart';

class EditableTitle extends StatefulWidget {
  EditableTitle({this.data = "", this.onChanged});
  final ValueChanged<String> onChanged;
  final String data;

  _EditableTitleState createState() => new _EditableTitleState();
}

class _EditableTitleState extends State<EditableTitle> {
  TextEditingController textController;
  void _onTextChangedListener() {
    widget.onChanged(textController.text);
  }

  @override
  void dispose() {
    textController.removeListener(_onTextChangedListener);
    textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    textController = new TextEditingController(text: widget.data);
    textController.addListener(_onTextChangedListener);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: const EdgeInsetsDirectional.only(bottom: 24.0),
        child: new TextFormField(
            controller: textController,
            decoration: new InputDecoration(
                border: InputBorder.none,
                hintText: "Title",
                hintStyle: new TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 34.0,
                    color: Colors.black54)),
            autofocus: widget.data.isEmpty,
            textAlign: TextAlign.left,
            style: new TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 34.0,
                color: Colors.black)));
  }
}
