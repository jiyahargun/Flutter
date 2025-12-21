import 'package:flutter/material.dart';
import 'second.dart';

void main() {
  runApp(MaterialApp(home: FirstScreen(), debugShowCheckedModeBanner: false));
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hero Animation")),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen()),
            );
          },
          child: Hero(
            tag: 'hero-image',
            child: Image.network(
              'https://img.freepik.com/free-photo/view-cartoon-animal-practicing-yoga_23-2151532840.jpg?semt=ais_hybrid&w=740&q=80',
              width: 350,
            ),
          ),
        ),
      ),
    );
  }
}
