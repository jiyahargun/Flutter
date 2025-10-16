import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ListApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class ListApp extends StatefulWidget {
  const ListApp({super.key});

  @override
  State<ListApp> createState() => _ListAppState();
}

class _ListAppState extends State<ListApp> {
  List items = [
    "Study",
    "Play",
    "Sleep",
    "Dance",
    "Sing",
    "Read",
    "Write",
    "Cook",
    "Study",
    "Play",
    "Sleep",
    "Dance",
    "Sing",
    "Read",
    "Write",
    "Cook",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'to do list',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onHorizontalDragEnd: (details) {
                if (details.primaryVelocity! < 0) {
                  setState(() {
                    items.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$item deleted')),
                  );
                }
              },
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  item,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
