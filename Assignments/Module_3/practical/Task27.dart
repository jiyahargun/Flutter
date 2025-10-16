import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: CustomList(), debugShowCheckedModeBanner: false));
}

class CustomList extends StatefulWidget {
  @override
  _CustomListState createState() => _CustomListState();
}

class _CustomListState extends State<CustomList> {
  List items = [
    "Task 1",
    "Task 2",
    "Task 3",
    "Task 4",
    "Task 5",
    "Task 1",
    "Task 2",
    "Task 3",
    "Task 4",
    "Task 5",
    "Task 1",
    "Task 2",
    "Task 3",
    "Task 4",
    "Task 5",
    "Task 1",
    "Task 2",
    "Task 3",
    "Task 4",
    "Task 5",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("list_tile")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.verified_user),
            title: Text(items[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  items.removeAt(index);
                });
              },
            ),
          );
        },
      ),
    );
  }
}
