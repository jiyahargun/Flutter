import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: FadeInImage(), debugShowCheckedModeBanner: false));
}

class FadeInImage extends StatelessWidget {
  const FadeInImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple FadeInImage')),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('asset/p1.jpg'),
          image: NetworkImage(
            'https://m.media-amazon.com/images/I/51P1d8NAG4L._AC_UF1000,1000_QL80_.jpg',
          ),
          width: 250,
          height: 250,
          fit: BoxFit.cover,
          fadeInDuration: Duration(seconds: 2),
        ),
      ),
    );
  }
}
