import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ExpandedApp()));
}

class ExpandedApp extends StatelessWidget {
  const ExpandedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Expanded')),
        body: const ExpandedExample(),
      ),
    );
  }
}

class ExpandedExample extends StatelessWidget {
  const ExpandedExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(color: Colors.purpleAccent, height: 100, width: 100),
          Expanded(child: Container(color: Colors.blueGrey, width: 100)),
          Container(color: Colors.grey, height: 100, width: 100),
        ],
      ),
    );
  }
}
