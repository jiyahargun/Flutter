import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false,));
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Center(
        child: Text("Hello Flutter!", style: TextStyle(fontSize: 30.0, color: Colors.black, fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
