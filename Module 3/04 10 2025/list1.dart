import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'List Example',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const ListEx(),
    );
  }
}

class ListEx extends StatefulWidget {
  const ListEx({super.key});

  @override
  State<ListEx> createState() => _ListExState();
}

class _ListExState extends State<ListEx> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List Data")),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwHnGCDpzI3pUCfAGaNJMKFmgF8t4hgd5Gfw&s",
                  width: 200,
                  height: 600,
                ),
                title: const Text("flowers"),
              ),
              const SizedBox(height: 30),
              ListTile(
                leading: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB1hUG2v7Yg64qx2uUGQ0TapUIpypt-oGSVw&s",
                  width: 200,
                  height: 200,
                ),
                title: const Text("flowers"),
              ),
              const SizedBox(height: 30),
              ListTile(
                leading: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwHnGCDpzI3pUCfAGaNJMKFmgF8t4hgd5Gfw&s",
                  width: 200,
                  height: 200,
                ),
                title: const Text("flowers"),
              ),
              const SizedBox(height: 30),
              ListTile(
                leading: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB1hUG2v7Yg64qx2uUGQ0TapUIpypt-oGSVw&s",
                  width: 200,
                  height: 200,
                ),
                title: const Text("flowers"),
              ),
              const SizedBox(height: 30),
              ListTile(
                leading: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB1hUG2v7Yg64qx2uUGQ0TapUIpypt-oGSVw&s",
                  width: 200,
                  height: 200,
                ),
                title: const Text("flowers"),
              ),
              const SizedBox(height: 30),
              ListTile(
                leading: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB1hUG2v7Yg64qx2uUGQ0TapUIpypt-oGSVw&s",
                  width: 200,
                  height: 200,
                ),
                title: const Text("flowers"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
