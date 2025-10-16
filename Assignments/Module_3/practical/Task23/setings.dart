import 'package:flutter/material.dart';

class Setings extends StatefulWidget {
  const Setings({super.key});

  @override
  State<Setings> createState() => _SetingsState();
}

class _SetingsState extends State<Setings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Screen",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTRS7n-H81mrBtmC2KLRCHIdn6sL-iH8yTYw&s',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
