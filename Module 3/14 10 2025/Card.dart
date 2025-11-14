import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyCardApp(), debugShowCheckedModeBanner: false));
}

class MyCardApp extends StatefulWidget {
  const MyCardApp({super.key});

  @override
  State<MyCardApp> createState() => _MyCardAppState();
}

class _MyCardAppState extends State<MyCardApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.verified_user_rounded,
                  color: Colors.blueGrey,
                ),
                title: Text('Jiya Hargun'),
                subtitle: Text('Flutter Developer'),
              ),
            ),

            SizedBox(height: 20),

            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.verified_user_rounded,
                  color: Colors.blueGrey,
                ),
                title: Text('Jiya Hargun'),
                subtitle: Text('Flutter Developer'),
              ),
            ),

            SizedBox(height: 20),

            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.verified_user_rounded,
                  color: Colors.blueGrey,
                ),
                title: Text('Jiya Hargun'),
                subtitle: Text('Flutter Developer'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
