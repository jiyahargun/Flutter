import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Status(), debugShowCheckedModeBanner: false));
}

class Status extends StatefulWidget {
  const Status({super.key});

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  bool isOnline = false;

  void toggleStatus() {
    setState(() {
      isOnline = !isOnline;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Online / Offline",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isOnline ? Colors.green : Colors.red,
                  width: 2,
                ),
              ),
              child: const CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTlRFmZMV_JmwJnT-HtJAltyJM2PUxQ7I86Q&s",
                ),
              ),
            ),

            Text(
              isOnline ? "Online" : "Offline",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isOnline ? Colors.green : Colors.red,
              ),
            ),
           
            ElevatedButton(
              onPressed: toggleStatus,
              style: ElevatedButton.styleFrom(
                backgroundColor: isOnline ? Colors.red : Colors.green,
              ),
              child: Text(
                isOnline ? "Go Offline" : "Go Online",
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
