import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(home: NameListScreen(), debugShowCheckedModeBanner: false),
  );
}

class NameListScreen extends StatelessWidget {
  List names = [
    "panda",
    "Lion",
    "swan",
    "tiger",
    "Rabbit",
    "sparrow",
    "eagle",
    "parrot",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Names List")),
      body: ListView.builder(
        itemCount: names.length,

        itemBuilder: (context, index) {
          return ListTile(
            title: Text(names[index]),
            onTap: () {
              print("${names[index]} tapped");
            },
          );
        },
      ),
    );
  }
}
