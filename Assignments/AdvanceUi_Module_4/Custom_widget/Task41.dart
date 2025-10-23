import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: RatingWidgetDemo(),
    debugShowCheckedModeBanner: false,
  ));
}

class RatingWidgetDemo extends StatefulWidget {
  @override
  _RatingWidgetDemoState createState() => _RatingWidgetDemoState();
}

class _RatingWidgetDemoState extends State<RatingWidgetDemo> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rating Widget'),
      ),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(5, (index) {
            return IconButton(
              icon: Icon(
                index < _rating ? Icons.star : Icons.star_border,
                color: Colors.amberAccent,
                size: 40,
              ),
              onPressed: () {
                setState(() {
                  _rating = index + 1; // Update rating
                });
              },
            );
          }),
        ),
      ),
    );
  }
}
