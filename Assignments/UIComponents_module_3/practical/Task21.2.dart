import 'package:flutter/material.dart';

class welcome extends StatelessWidget {
  const welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Welcome',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
        ),
      ),
    );
  }
}
