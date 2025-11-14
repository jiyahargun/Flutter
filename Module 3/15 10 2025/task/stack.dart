import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: StackExample(), debugShowCheckedModeBanner: false));
}

class StackExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
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
                fontSize: 32,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    offset: Offset(2, 2),
                    blurRadius: 5,
                    color: Colors.black54,
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
