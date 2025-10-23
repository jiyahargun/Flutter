import 'package:flutter/material.dart';

class screenthree extends StatefulWidget {
  const screenthree({super.key});

  @override
  State<screenthree> createState() => _screenthreeState();
}

class _screenthreeState extends State<screenthree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
      body: Center(
        child: Text(
          'SettingsScreen',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
