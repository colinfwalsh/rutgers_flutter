import 'package:flutter/material.dart';
import './screens/dashboard.dart';

void main() => runApp(MyApp());

Map<int, Color> color =
{
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

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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

        primarySwatch: MaterialColor(0xffcc0033, color)
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            // title: Text(title),
            backgroundColor: const Color(0xffcc0033),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.settings, color: Colors.white)
              )
            ],
            title: Text('Rutgers')
          ),
          body: TabBarView(
            children: [
              Icon(Icons.home),
              DashBoard(items: [
                UserItem("Colin Walsh", "Undergrad", "assets/me.jpeg"),
                ClassItem(),
                ScheduleItem(),
                DiningOptions(),
                BusFavorites()
              ]),
              Icon(Icons.supervised_user_circle),
            ],
          ),
          bottomNavigationBar: Container(
            color: const Color(0xffcc0033),
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
