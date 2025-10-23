import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: BottomNavigationBar1(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class BottomNavigationBar1 extends StatefulWidget {
  const BottomNavigationBar1({super.key});

  @override
  State<BottomNavigationBar1> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBar1> {
  int _selectedIndex = 0;

  List images = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8pmh0-QAqJMamE6FupRtB_9EgEO7Q48IY2g&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6XjDkE0JJQpp6z-XEIcYonlfXxroXqx1w3w&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2OiL34vtU1cGNsFglsqFMNI8lwUHi7DUF5A&s',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bottom")),

      body: Center(
        child: Image.network(
          images[_selectedIndex],
          height: 300,
          width: 300,
          fit: BoxFit.cover,
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_rounded), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
