import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Floating Action Button")),
      body: Center(
        child: Column(
          children: [
            Text("$count"),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              child: Text("increment"),
            ),
          ],
        ),
      ),
    );
  }
}
