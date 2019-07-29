/// Author: Christian Juth
/// Date: 7/28/19
/// File: module_container.dart
/// Summary:
///   Module container encapsolates all widgets.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './module_config.dart';




class ModuleContainer extends StatelessWidget {
  final Widget child;
  ModuleContainer({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ModuleConfig config = Provider.of<ModuleConfig>(context);

    return Card(
      color: config.darkMode? Color(0xff000000) : Color(0xffFFFFFF),
      child: this.child
    );
  }
}



class ModuleText extends StatelessWidget {
  String text;

  ModuleText(text) {
    this.text = text;
  }

  @override
  Widget build(BuildContext context) {
    ModuleConfig config = Provider.of<ModuleConfig>(context);

    return Text(
      this.text,
      style: TextStyle(
        color: config.darkMode? Color(0xffFFFFFF) : Color(0xff000000)
      )
    );
  }
}
