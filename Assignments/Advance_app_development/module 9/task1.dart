l̥import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Button(), debugShowCheckedModeBanner: false));
}

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  double _width = 150;
  double _height = 50;
  Color _color = Colors.green;

  void _animateButton() {
    setState(() {
      if (_width == 150) {
        _width = 200;
        _height = 70;
      } else {
        _width = 150;
        _height = 50;
      }

      if (_color == Colors.green) {
        _color = Colors.grey;
      } else {
        _color = Colors.green;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animated Button")),
      body: Center(
        child: GestureDetector(
          onTap: _animateButton,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: _color,
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: const Text(
              "click me",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
