import 'package:flutter/material.dart';
import 'package:teadiary/colors/colors.dart';
import 'package:teadiary/widget/appbar.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        titleWidget: const Text("About Us"),
        centerTitle: true,
        showLeading: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset("assets/splashscreen.png", height: 120)),
            const SizedBox(height: 16),

            Center(
              child: Text(
                "Tea Diary",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              "About the App",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              "Tea Diary is designed to help you manage your daily tea and coffee sales, "
              "track orders, generate bills, and analyze sales efficiently. "
              "Our goal is to simplify your business operations and save your valuable time.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 24),

            const Text(
              "Contact Us",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              "Email: support@teadiary.com\n"
              "Phone: +91 12345 67890\n"
              "Address: 123 Business Rd, City, State, Zip",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 24),

            Center(
              child: Text(
                "© 2026 Tea Diary. All rights reserved.",
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
