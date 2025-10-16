import 'package:flutter/material.dart';
import 'package:task_21/second.dart';

void main() {
  runApp(MaterialApp(home: screen(), debugShowCheckedModeBanner: false));
}

class screen extends StatelessWidget {
  const screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "screen",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => welcome()),
            );
          },
          child: Text('Next'),
        ),
      ),
    );
  }
}
