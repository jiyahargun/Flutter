import 'package:flutter/material.dart';

class screentwo extends StatefulWidget {
  const screentwo({super.key});

  @override
  State<screentwo> createState() => _screentwoState();
}

class _screentwoState extends State<screentwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile-screen',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
      body: Center(
        child: Text(
          'ProfileScreen',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
