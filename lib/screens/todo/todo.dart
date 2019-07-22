import 'package:flutter/material.dart';
import './check_row.dart';

class Todo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TodoState();
  }
}

class TodoState extends State<Todo> {

  var _items = [];
  var _inputVal = '';
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    List<CheckRow> items = [];

    this._items.forEach((number) {
      items.add(CheckRow(number));
    });

    return MaterialApp(
      title: 'Todo List',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Todo List'),
        ),
        body: ListView(
          children: [
            TextField(
              controller: this.textController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Write Task Here',
                contentPadding: const EdgeInsets.all(15.0),
              ),
              onChanged: (text) {
                setState(() {
                  this._inputVal = text;
                });
              },
            ),
            ...items
          ]
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              this._items.add(this._inputVal);
              textController.text = '';
            });
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.pink,
        ),
      ),
    );
  }
}
