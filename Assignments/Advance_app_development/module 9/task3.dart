import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: LoadingImage(), debugShowCheckedModeBanner: false));
}

class LoadingImage extends StatefulWidget {
  const LoadingImage({super.key});

  @override
  State<LoadingImage> createState() => _LoadingImageState();
}

class _LoadingImageState extends State<LoadingImage> {
  bool _isLoading = false;
  String _data = "";

  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      _isLoading = false;
      _data = "Data fetched successfully!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Simple Loading Image")),
      body: Center(
        child: _isLoading
            ? AnimatedRotation(
                turns: 1,
                duration: const Duration(seconds: 1),
                curve: Curves.linear,
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWKe5q4BRUQyVPRZOZlgj6JBWk07ElYtP3kA&s',
                  width: 300,
                  height: 200,
                ),
              )
            : _data.isEmpty
            ? ElevatedButton(onPressed: _fetchData, child: Text("Fetch Data"))
            : Text(_data, style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
