/// Author: Christian Juth
/// Date: 7/28/19
/// File: module.dart
/// Summary:
///   Module is the wrapper component and provider
///   for all modules. It is the only class needed
///   to implement widgets. The main class "Module"
///   takes an argument "widget" which allows the
///   developer to programatically select which
///   widget they want.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './module_config.dart';
import '../theme.dart';

// import all modules
import './modules/profile_module.dart';



@immutable
class Widgets{
  static get(String style, String name) {
    switch(name+'_'+style) {
      case 'profile_card': return ProfileCard();
      case 'profile_widget': return ProfileCard();
      // case 'profile': return ProfileCard();

      // if no widget was found
      // show 404 text on screen
      default: return Text('404');
    }
  }
}

class Module extends StatelessWidget {
  final String widget;
  final String style;

  Module({
    Key key,
    @required this.widget,
    @required this.style
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeColors theme = Provider.of<ThemeColors>(context);

    return Provider<ModuleConfig>.value(
      value: new ModuleConfig(
        darkMode: theme.darkMode
      ),
      child: Widgets.get(this.style, this.widget)
    );
  }
}
