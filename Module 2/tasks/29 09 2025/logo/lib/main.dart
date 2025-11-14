import 'package:flutter/material.dart';
import 'package:logo/splashscreen.dart';

void main() {
  runApp(MaterialApp(home:  Splashscreen(),debugShowCheckedModeBanner: false,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)
  {
   return Scaffold
     (
     appBar: AppBar(title: Text("LOGO"),),
   );
  }
}
