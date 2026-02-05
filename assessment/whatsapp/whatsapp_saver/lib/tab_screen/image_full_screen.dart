import 'dart:io';
import 'package:flutter/material.dart';
import 'package:whatsapp_saver/constant/constant.dart';

class ImageFullScreen extends StatelessWidget {
  final String imageUrl;

  const ImageFullScreen({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: kBlack,
        iconTheme: const IconThemeData(color: kWhite),
      ),
      body: Center(
        child: Image.file(
          File(imageUrl),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
