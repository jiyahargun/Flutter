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
          "Responsive Row Layout",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          children: [
            SizedBox(width: 10),

            Container(
              width: 200,
              height: 100,
              color: Colors.red[500],
              child: Center(
                child: Text(
                  "Flutter",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),

            Container(
              width: 300,
              height: 100,
              color: Colors.blue[300],
              child: Center(
                child: Text(
                  "Python",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),

            Container(
              width: 400,
              height: 100,
              color: Colors.brown[300],
              child: Center(
                child: Text(
                  "java",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
