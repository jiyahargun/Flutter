import 'dart:async';
import 'package:flutter/material.dart';
import 'package:logo/main.dart';

class Splashscreen extends StatefulWidget
{
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
{
  @override
  void initState()
  {
    Timer(
      Duration(seconds: 3),
          () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyApp()),
      ),
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Center(
        child: CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage('assets/image.jpg'),
        ),
      ),
    );
  }
}