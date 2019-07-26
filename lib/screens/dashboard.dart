import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class DashBoard extends StatelessWidget {
  final List<ListItem> items;

  DashBoard({Key key, @required this.items}) : super(key: key);

  void _pushWebview(BuildContext context) {
    Navigator.of(context).pushNamed('/webView');
  }

  @override
  Widget build(BuildContext context) {
    final title = 'MyRutgers app';
    return Scaffold(
        body: Container(
          color: const Color(0xffE9EDEF),
          child: ListView.builder(
            // Let the ListView know how many items it needs to build.
            itemCount: items.length,
            // Provide a builder function. This is where the magic happens.
            // Convert each item into a widget based on the type of item it is.
            itemBuilder: (context, index) {
              final item = items[index];

              if (item is UserItem) {
                return Container(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 6.0, top: 10.0),
                    child: Card(
                        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                        child: Container(
                          //color: Colors.white,
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
                    child: Card(
                      child: ExpansionTile(
                          title:
                            Text("Upcoming Assignments",
                              style: TextStyle(color: const Color(0xffcc2727))),
                          initiallyExpanded: true,
                          children: <Widget>[
                            ListView.builder(
                                itemCount: 5,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, idx) {
                                  switch (idx) {
                                    case 0:
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Text("All", style: TextStyle(color: const Color(0xff888888))),
                                          Text("Sakai",
                                              style: TextStyle(
                                                  decoration: TextDecoration.underline,
                                                  color: const Color(0xffCC2727)
                                              )),
                                          Text("Canvas", style: TextStyle(color: const Color(0xff888888))),
                                          Text("Moodle", style: TextStyle(color: const Color(0xff888888))),
                                          Text("BlackBoard", style: TextStyle(color: const Color(0xff888888)))
                                        ],
                                      );
                                    case 1:
                                      return ListTile(title: Text("Test 2 on Monday"),
                                        subtitle: Text("Intro to Comp Sci"),
                                        trailing: IconButton(
                                            icon: Icon(Icons.alarm_add, color: const Color(0xffcc2727)),
                                            alignment: Alignment.centerRight,
                                            onPressed: () async {await _classNotify(context, "Test 2");}),
                                      );
                                    case 2:
                                      return ListTile(title: Text("Quiz 2 by Thursday"),
                                        subtitle: Text("Planet Earth"),
                                        trailing: IconButton(
                                            icon: Icon(Icons.alarm_add, color: const Color(0xffcc2727)),
                                            alignment: Alignment.centerRight,
                                            onPressed: () async {await _classNotify(context, "Quiz 2");}),
                                      );
                                    case 3:
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
                    child: Card(
                      child: ExpansionTile(
                          title: Text("My Classes", style: TextStyle(color: const Color(0xffcc2727))),
                          initiallyExpanded: true,
                          children: <Widget>[
                            ListView.builder(
                                itemCount: 5,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, idx) {
                                  switch (idx) {
                                    case 0:
                                      return Container(
                                          padding: EdgeInsets.all(8.0),
                                          child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Text("WebReg", style: TextStyle(color: const Color(0xff888888))),
                                                Text("Degree Navigator", style: TextStyle(color: const Color(0xff888888)))
                                              ])
                                      );
                                    case 1:
                                      return ListTile(title: Text("Intro to Comp Sci"),
                                        subtitle: Row(
                                            children:
                                            <Widget>[Text("Core 101: ", style: TextStyle(color: Colors.black54)),
                                              Text("TTh 12:00pm-2:50pm", style: TextStyle(color: Colors.black38)),
                                            ]),
                                      );
                                    case 2:
                                      return ListTile(title: Text("Planet Earth"),
                                        subtitle: Text("VH 102: MWF 1:00pm-2:10pm"),
                                      );
                                    case 3:
                                      return ListTile(title: Text("College Research and Writing"),
                                        subtitle: Text("C/D Bio 104: MWF 8:00am-9:50am"),
                                      );
                                    default:
                                      return ListTile(title: Text("Data 101"),
                                        subtitle: Text("Hill 103: TTh 3:10pm-5:30pm"),
                                      );
                                  }
                                })]
                      ),
                    )
                );
              } else if (item is DiningOptions) {
                return Container(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 6.0),
                    child: Card(
                        child: ExpansionTile(
                          title: Text("Dining Options", style: TextStyle(color: const Color(0xffcc2727))),
                          initiallyExpanded: true,
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
                    child: Card(
                        child: ExpansionTile(
                            title: Text("Favorited Bus Routes/Stops", style: TextStyle(color: const Color(0xffcc2727))),
                            initiallyExpanded: true,
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
