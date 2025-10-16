import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Text Widget",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            Text(
              "Jiya Hargun",
              style: TextStyle(
                fontSize: 25,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Flutter, Developer",
              style: TextStyle(
                fontSize: 35,
                color: Colors.brown,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
