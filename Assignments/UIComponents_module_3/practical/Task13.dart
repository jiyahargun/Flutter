import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(home: ImageScaffoldApp(), debugShowCheckedModeBanner: false),
  );
}

class ImageScaffoldApp extends StatefulWidget {
  @override
  _ImageScaffoldAppState createState() => _ImageScaffoldAppState();
}

class _ImageScaffoldAppState extends State<ImageScaffoldApp> {
  List images = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9JUm2wyp6OQoa1rsWY_oQ-nMWS85NJLEiMA&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRihBFuXBd__KGaaFaRt69w-cT5M2reHJV_mg&s',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    changeImage() {
      setState(() {
        if (currentIndex == 0) {
          currentIndex = 1;
        } else {
          currentIndex = 0;
        }
      });
    }

    return Scaffold(
      appBar: AppBar(title: Text("image")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(images[currentIndex]),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: changeImage,
              child: Text('Change Image', style: TextStyle(fontSize: 25)),
            ),
          ],
        ),
      ),
    );
  }
}
