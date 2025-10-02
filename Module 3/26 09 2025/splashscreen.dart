import 'dart:async';
import 'package:f5/main.dart';
import 'package:flutter/material.dart';

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
        MaterialPageRoute(builder: (context) => FormEx()),
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
          backgroundImage: AssetImage('assets/pandaa.jpg'),
        ),
      ),
    );
  }
}
