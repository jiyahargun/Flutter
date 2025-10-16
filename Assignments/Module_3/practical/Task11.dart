import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Counter(), debugShowCheckedModeBanner: false));
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _MyAppState();
}

class _MyAppState extends State<Counter> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Counter App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Counter Value",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              '$counter',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counter--;
                    });
                  },
                  child: Text('-'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counter++;
                    });
                  },
                  child: Text('+'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
