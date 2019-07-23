import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() {
  runApp(MyApp(
    items: [HeadingItem("myDashboard"),
    UserItem("Colin Walsh", "Undergrad", "assets/me.jpeg"),
    ClassItem(),
    ScheduleItem(),
    DiningOptions(),
    BusFavorites()
    ],
  )
  );
}

/*
List<ListItem>.generate(
      1000,
          (i) => i % 6 == 0
          ? HeadingItem("Heading $i")
          : MessageItem("Sender $i", "Message body $i", "assets/me.jpeg")
 */


class MyApp extends StatelessWidget {
  final List<ListItem> items;

  MyApp({Key key, @required this.items}) : super(key: key);

  void _pushWebview(BuildContext context) {
    Navigator.of(context).pushNamed('/webView');
  }

  @override
  Widget build(BuildContext context) {
    final title = 'MyRutgers app';
    return MaterialApp(
      title: title,
      routes: {
        '/webView': (_) =>
        new WebviewScaffold(
          url: "https:\\fluttercentral.com",
          appBar: new AppBar(
            title: const Text('Widget Webview'),
          ),
          withZoom: false,
          withLocalStorage: true,
        )
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: const Color(0xffcc0033),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.settings, color: Colors.white)
            ),
            IconButton(
                icon: Icon(Icons.supervised_user_circle, color: Colors.white)
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: null),
        body: Container(
          color: const Color(0xffE9EDEF),
          child: ListView.builder(
            // Let the ListView know how many items it needs to build.
            itemCount: items.length,
            // Provide a builder function. This is where the magic happens.
            // Convert each item into a widget based on the type of item it is.
            itemBuilder: (context, index) {
              final item = items[index];

              if (item is HeadingItem) {
                return Container(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      Container(width: 10,),
                      Text(
                          item.heading,
                          style: TextStyle(decoration: TextDecoration.underline, color: const Color(0xffCC2727), fontSize: 25.0)
                      ),
                      Container(width: 40),
                      Text("myDay", style: TextStyle(color: const Color(0xff888888), fontSize: 25.0)),
                    ],
                    )
                );
              } else if (item is UserItem) {
                return Container(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 6.0, top: 10.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Container(
                            color: Colors.white,
                            child: ListTile(
                              onTap: null,
                              leading: CircleAvatar(
                                  backgroundImage: AssetImage(item.image)
                              ),
                              title: Text(item.title),
                              subtitle: Text(item.subtitle),
                            )
                        )
                    )
                );
              } else if (item is ScheduleItem) {
                return Container(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 6.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: ExpansionTile(
                          title: Text("Upcoming Assignments", style: TextStyle(color: const Color(0xffcc2727))),
                          backgroundColor: Colors.white,
                          initiallyExpanded: true,
                          children: <Widget>[
                            ListView.builder(
                                itemCount: 4,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, idx) {
                                  switch (idx) {
                                    case 0:
                                      return ListTile(title: Text("Test 2 on Monday"),
                                        subtitle: Text("Intro to Comp Sci"),
                                        trailing: IconButton(
                                            icon: Icon(Icons.alarm_add, color: const Color(0xffcc2727)),
                                            alignment: Alignment.centerRight,
                                            onPressed: () async {await _classNotify(context, "Test 2");}),
                                      );
                                    case 1:
                                      return ListTile(title: Text("Quiz 2 by Thursday"),
                                        subtitle: Text("Planet Earth"),
                                        trailing: IconButton(
                                            icon: Icon(Icons.alarm_add, color: const Color(0xffcc2727)),
                                            alignment: Alignment.centerRight,
                                            onPressed: () async {await _classNotify(context, "Quiz 2");}),
                                      );
                                    case 2:
                                      return ListTile(title: Text("Essay 2 due @ 11pm"),
                                        subtitle: Text("College Research and Writing"),
                                        trailing: IconButton(
                                            icon: Icon(Icons.alarm_add, color: const Color(0xffcc2727)),
                                            alignment: Alignment.centerRight,
                                            onPressed: () async {await _classNotify(context, "Essay 2");}),
                                      );
                                    default:
                                      return ListTile(title: Text("Assign 2 due 9/2"),
                                        subtitle: Text("Data 101"),
                                        trailing: IconButton(
                                            icon: Icon(Icons.alarm_add, color: const Color(0xffcc2727)),
                                            alignment: Alignment.centerRight,
                                            onPressed: () async {await _classNotify(context, "Assign 2");}),
                                      );
                                  }
                                })]
                      ),
                    )
                );
              } else if (item is ClassItem) {
                return Container(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 6.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: ExpansionTile(
                          title: Text("My Classes", style: TextStyle(color: const Color(0xffcc2727))),
                          backgroundColor: Colors.white,
                          initiallyExpanded: true,
                          children: <Widget>[
                            ListView.builder(
                                itemCount: 4,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, idx) {
                                  switch (idx) {
                                    case 0:
                                      return ListTile(title: Text("Intro to Comp Sci"),
                                        subtitle: Text("TTh 12:00pm-2:50pm"),
                                      );
                                    case 1:
                                      return ListTile(title: Text("Planet Earth"),
                                        subtitle: Text("MWF 1:00pm-2:10pm"),
                                      );
                                    case 2:
                                      return ListTile(title: Text("College Research and Writing"),
                                        subtitle: Text("MWF 8:00am-9:50am"),
                                      );
                                    default:
                                      return ListTile(title: Text("Data 101"),
                                        subtitle: Text("TTh 3:10pm-5:30pm"),
                                      );
                                  }
                                })]
                      ),
                    )
                );
            } else if (item is DiningOptions) {
                return Container(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 6.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: ExpansionTile(
                          title: Text("Dining Options", style: TextStyle(color: const Color(0xffcc2727))),
                          initiallyExpanded: true,
                          backgroundColor: Colors.white,
                          children: <Widget>[
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: 4,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, idx) {
                                  switch (idx) {
                                    case 0:
                                      return ListTile(
                                          title: Text("Busch Dining Hall"),
                                          subtitle: Text("Busch Campus"),
                                        onTap: () {_pushWebview(context);},
                                      );
                                  case 1:
                                  return ListTile(
                                  title: Text("Brower Commons"),
                                  subtitle: Text("College Ave Campus")
                                  );
                                  case 2:
                                  return ListTile(
                                  title: Text("Livingston Dining Hall"),
                                  subtitle: Text("Livingston Campus")
                                  );
                                  default:
                                  return ListTile(
                                  title: Text("Cook Dining Hall"),
                                  subtitle: Text("Cook/Douglass Campus")
                                  );
                                }
                                })
                          ],
                        )
                    )
                );


              } else if (item is BusFavorites) {
                return Container(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 6.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: ExpansionTile(
                            title: Text("Favorited Bus Routes/Stops", style: TextStyle(color: const Color(0xffcc2727))),
                            initiallyExpanded: true,
                            backgroundColor: Colors.white,
                            children: <Widget>[
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 6,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, idx) {
                                    switch (idx) {
                                      case 0:
                                        return ListTile(title: Text("Routes",
                                            style: Theme.of(context).textTheme.title));
                                      case 1:
                                        return ListTile(title: Text("Route A"),
                                            subtitle: Text("Next Stop: Hill Center"),
                                            trailing: Icon(Icons.favorite, color: const Color(0xffcc2727))
                                        );
                                      case 2:
                                        return ListTile(title: Text("Route C"),
                                            subtitle: Text("Next Stop: Busch Student Center"),
                                            trailing: Icon(Icons.favorite, color: const Color(0xffcc2727))
                                        );
                                      case 3:
                                        return ListTile(title: Text("Stops",
                                            style: Theme.of(context).textTheme.title));
                                      case 4:
                                        return ListTile(title: Text("Hill Center"),
                                            subtitle: Text("Route A: 5 mins, Route B: 2 mins"),
                                            trailing: Icon(Icons.favorite, color: const Color(0xffcc2727))
                                        );
                                      case 5:
                                        return ListTile(title: Text("Scott Hall"),
                                            subtitle: Text("Route A: 3 mins, Route C: 10 mins"),
                                            trailing: Icon(Icons.favorite, color: const Color(0xffcc2727))
                                        );
                                      default:
                                        return ListTile(title: Text("Livingston Student Center"));
                                    }
                                  })
                            ])
                    )
                );
              } else {
                return ListTile(
                  title: Text("No data"),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<void> _classNotify(BuildContext context, String assignment) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Added to reminders'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Added: \'${assignment}\' to your reminders'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

// The base class for the different types of items the list can contain.
//Ah so they make this an Interface in order to add to a list of different types
abstract class ListItem {}


// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

// A ListItem that contains data to display a message.
class UserItem implements ListItem {
  final String title;
  final String subtitle;
  final String image;

  UserItem(this.title, this.subtitle, this.image);
}
class ClassItem implements ListItem {

}

class ScheduleItem implements ListItem {

}

class DiningOptions implements ListItem {

}

class BusFavorites implements ListItem {

}
