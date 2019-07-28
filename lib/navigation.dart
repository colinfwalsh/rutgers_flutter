/// Author: Christian Juth
/// Date: 7/26/19
/// File: navigation.dart
/// Summary:
///   This file contains both the TabBarView
///   and bottomNavigationBar widgets.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './theme.dart';

// screens
import './screens/home_screen.dart';
import './screens/dashboard_screen.dart';
import './screens/profile_screen.dart';


class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeColors theme = Provider.of<ThemeColors>(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          children: [
            HomeScreen(),
            DashboardScreen(items: [
              UserItem("Colin Walsh", "Undergrad", "assets/me.jpeg"),
              ClassItem(),
              ScheduleItem(),
              DiningOptions(),
              BusFavorites()
            ]),
            ProfileScreen(),
          ],
        ),
        bottomNavigationBar: Container(
          color: theme.primary,
          child: new TabBar(
            tabs: [
              Tab(icon: new Icon(Icons.home)),
              Tab(icon: new Icon(Icons.apps)),
              Tab(icon: new Icon(Icons.person))
            ]
          ),
        ),
      ),
    );
  }
}
