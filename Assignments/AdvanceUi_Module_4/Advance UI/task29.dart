import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(home: OverlayExample(), debugShowCheckedModeBanner: false),
  );
}

class OverlayExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSALvcXuBBh3sYUIR8PPoShD9BUtIqlaL4OSQ&s',
              width: 500,
              height: 400,
              fit: BoxFit.cover,
            ),

            Text(
              'Happy Diwali',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
