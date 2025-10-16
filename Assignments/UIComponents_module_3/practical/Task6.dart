import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Name & Bio")),
      body: Center(
        child: Column(
          children: [
            Container(child: Padding(padding: EdgeInsets.all(8.0))),

            Container(
              color: Colors.grey.shade500,
              padding: EdgeInsets.all(11.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(
                      "https://t3.ftcdn.net/jpg/13/47/43/94/360_F_1347439416_nYUpA4Hxn8BNIB9KUIZG0CE77bNOr5Vg.jpg",
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jiya Hargun',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'I am a curious and passionate individual, always eager to learn and grow.',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'enjoy exploring new ideas and taking on challenges that push me forward..',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Connecting with people and sharing knowledge inspires me every day.',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'I strive to make a meaningful impact in everything I do and embrace every experience as a chance to grow,',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
