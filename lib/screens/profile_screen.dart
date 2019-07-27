import 'package:flutter/material.dart';
import '../theme.dart';
import '../screens/settings_page.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          )
        ]
      ),
      body: Container(
        color: ThemeColors.background,
        child: Center(
          child: Icon(Icons.person)
        )
      )
    );
  }
}
