import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ImageCarousel(), debugShowCheckedModeBanner: false));
}

class ImageCarousel extends StatefulWidget {
  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  late Timer _timer;

  List images = [
    'assets/nature.jpeg',
    'assets/peacock.jpeg',
    'assets/tree.jpeg',
  ];

  @override
  initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _controller.animateToPage(
        _currentPage,
        duration: Duration(seconds: 1),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pageview")),
      body: Center(
        child: PageView.builder(
          controller: _controller,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Image.asset(images[index], height: 300, width: 150);
          },
        ),
      ),
    );
  }
}
