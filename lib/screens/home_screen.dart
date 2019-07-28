import 'package:flutter/material.dart';
import '../widgets/module.dart';
import 'package:provider/provider.dart';
import '../theme.dart';

class HomeScreen extends StatelessWidget {

  final widgets = [
    'profile'
  ];

  @override
  Widget build(BuildContext context) {
    ThemeColors theme = Provider.of<ThemeColors>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Rutgers"),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              print('impliment search');
            },
          )
        ]
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
            ...this.widgets.map((widget) => Module(
              style: 'card',
              widget: widget
            ))
          ]
        )
      )
    );
  }
}
