import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String username;

  const SecondScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      body: Center(
        child: Text(
          "Welcome, $username!",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
