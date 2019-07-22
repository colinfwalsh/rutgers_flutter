import 'package:flutter/material.dart';

class CheckRow extends StatefulWidget {
  String title;

  CheckRow(String title) {
    this.title = title;
  }

  @override
  State<StatefulWidget> createState() {
    return CheckRowState();
  }
}

class CheckRowState extends State<CheckRow> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        this.widget.title,
        style: TextStyle(
          decoration: this._checked ? TextDecoration.lineThrough : null
        )
      ),
      value: _checked,
      onChanged: (bool value) {
        setState(() {
          _checked = value;
        });
      }
    );
  }
}
