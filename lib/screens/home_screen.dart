import 'package:flutter/material.dart';
import '../theme.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rutgers"),
      ),
      body: Container(
        color: ThemeColors.background,
        child: ListView(
          children: [
            Container(
              color: Color(0xffDDDDDD),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(15.0),
                  hintText: 'Search rutgers'
                )
              )
            )
          ]
        )
      )
    );
  }
}
