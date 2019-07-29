import 'package:flutter/material.dart';
import '../widgets/module.dart';
import 'package:provider/provider.dart';
import '../theme.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeColors theme = Provider.of<ThemeColors>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Container(
        color: theme.background,
        child: ListView(
          children: [
            // Container(
            //   color: Color(0xffDDDDDD),
            //   child: TextField(
            //     decoration: InputDecoration(
            //       border: InputBorder.none,
            //       contentPadding: const EdgeInsets.all(15.0),
            //       hintText: 'Search rutgers'
            //     )
            //   )
            // ),
            Module(
              style: 'card',
              widget: 'profile'
            )
          ]
        )
      )
    );
  }
}
