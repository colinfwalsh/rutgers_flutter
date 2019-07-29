import 'package:flutter/material.dart';
import '../screens/settings_page.dart';
import 'package:provider/provider.dart';
import '../theme.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeColors theme = Provider.of<ThemeColors>(context);

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
        color: theme.background,
        child: Center(
          child: Icon(Icons.person)
        )
      )
    );
  }
}
