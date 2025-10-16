import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: asset(), debugShowCheckedModeBanner: false));
}

class asset extends StatelessWidget {
  const asset({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Asset Image")),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/nature.jpeg',
              width: 200,
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/peacock.jpeg',
              width: 200,
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/tree.jpeg',
              width: 200,
              height: 150,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
