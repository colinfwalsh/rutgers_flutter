import 'package:flutter/material.dart';
import '../theme.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Container(
        color: ThemeColors.background,
        child: Center(
          child: Icon(Icons.settings)
        )
      )
    );
  }
}
