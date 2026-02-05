import 'dart:async';
import 'package:flutter/material.dart';
import 'package:whatsapp_saver/constant/constant.dart';
import 'package:whatsapp_saver/dashboard_screen/dashboard.dart';
import 'package:whatsapp_saver/service/permission_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      _checkPermissionAndNavigate();
    });
  }

  Future<void> _checkPermissionAndNavigate() async {
    bool granted =
    await PermissionService.requestStoragePermission(context);

    if (!mounted) return;

    if (granted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const DashboardScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
          Text('Permission required to view WhatsApp Status'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/whatsapp.jpg',
              width: 120,
              height: 120,
            ),
            const SizedBox(height: 20),
            const Text(
              'WhatsApp Status Saver',
              style: TextStyle(
                color: kWhite,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
