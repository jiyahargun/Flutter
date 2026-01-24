import 'dart:async';
import 'package:flutter/material.dart';

import 'package:teadiary/colors/colors.dart';
import 'package:teadiary/screens/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/splashscreen.png"),
            const SizedBox(height: 30),
            // Text(
            //   "Tea Diary",
            //   style: TextStyle(
            //     fontSize: 40,
            //     color: CustomColors.primaryColor,
            //     fontWeight: FontWeight.w600,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
