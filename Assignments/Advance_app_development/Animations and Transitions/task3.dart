import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: HomeScreen(), debugShowCheckedModeBanner: false));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pulsing Button App')),
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 1.0, end: _scale),
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          builder: (context, scale, child) {
            return Transform.scale(scale: scale, child: child);
          },
          child: ElevatedButton(
            onPressed: () {
              setState(() => _scale = 1.2);
              Future.delayed(Duration(milliseconds: 200), () {
                setState(() => _scale = 1.0);
              });
            },
            child: Text('Click Me'),
          ),
        ),
      ),
    );
  }
}
