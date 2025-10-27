import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Navigation Drawer")),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Tops Technologies"),
              accountEmail: Text("tops@gmail.com"),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text("Contact"),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("settings"),
            ),
          ],
        ),
      ),
    );
  }
}
