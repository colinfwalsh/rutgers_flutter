import 'package:flutter/material.dart';
import './theme.dart';

// screens
import './screens/home_screen.dart';
import './screens/dashboard_screen.dart';
import './screens/profile_screen.dart';


class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.

        primarySwatch: ThemeColors.primary
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: ThemeColors.primary,
          //   title: Text('Rutgers'),
          //   actions: <Widget>[
          //     IconButton(
          //       icon: Icon(Icons.settings, color: Colors.white),
          //       onPressed: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (context) => SettingsPage()),
          //         );
          //       },
          //     )
          //   ]
          // ),
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
            color: ThemeColors.primary,
            child: new TabBar(
              tabs: [
                Tab(
                  icon: new Icon(Icons.home),
                ),
                Tab(
                  icon: new Icon(Icons.apps),
                ),
                Tab(
                  icon: new Icon(Icons.person),
                )
              ]
            ),
          ),
        ),
      )
    );
  }
}
