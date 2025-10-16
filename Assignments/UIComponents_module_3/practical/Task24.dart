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
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRszjW9K63XvBqdGAqyL9G6bB2esTDHHAnSzw&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSesI05cNORjWsP-FtcmRLyd2DtpjOaJsJbcw&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdjLlJS2C2KD-fRoOykz8e5luqOtFFpGo_QQ&s',
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
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'News'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
