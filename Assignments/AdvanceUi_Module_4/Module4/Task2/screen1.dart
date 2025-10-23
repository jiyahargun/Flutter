import 'package:flutter/material.dart';

class screenone extends StatefulWidget {
  const screenone({super.key});

  @override
  State<screenone> createState() => _screenoneState();
}

class _screenoneState extends State<screenone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Homescreen',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
      body: Center(
        child: Text(
          'HomeScreen',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}


