import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Map<int, Color> color = {
  50:Color.fromRGBO(136,14,79, .1),
  100:Color.fromRGBO(136,14,79, .2),
  200:Color.fromRGBO(136,14,79, .3),
  300:Color.fromRGBO(136,14,79, .4),
  400:Color.fromRGBO(136,14,79, .5),
  500:Color.fromRGBO(136,14,79, .6),
  600:Color.fromRGBO(136,14,79, .7),
  700:Color.fromRGBO(136,14,79, .8),
  800:Color.fromRGBO(136,14,79, .9),
  900:Color.fromRGBO(136,14,79, 1),
};

class ThemeColors {
  Color primary;
  Color background;
  bool darkMode;

  ThemeColors({darkMode}) {
    this.darkMode = darkMode;
    this.primary = MaterialColor(darkMode ? 0xff000000 : 0xffcc0033, color);
    this.background = Color(darkMode ? 0xff333333 : 0xffE9EDEF);
  }
}

class ThemeProvider extends StatelessWidget {
  Widget home;
  bool darkMode;

  ThemeProvider({home, darkMode}) {
    this.darkMode ??= darkMode;
    this.home = home;
  }

  @override
  Widget build(BuildContext context) {
    ThemeColors theme = new ThemeColors(
      darkMode: this.darkMode
    );

    return Provider<ThemeColors>.value(
      value: theme,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: theme.primary
        ),
        home: this.home
      )
    );
  }
}
