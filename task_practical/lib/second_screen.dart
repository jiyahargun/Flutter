import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Dashboard"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Card(
          margin:
          const EdgeInsets.all(20),
          elevation: 8,
          child: Padding(
            padding:
            const EdgeInsets.all(25),
            child: Column(
              mainAxisSize:
              MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor:
                  Colors.blue.shade100,
                  child: const Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.blue,
                  ),
                ),

                const SizedBox(
                    height: 20),

                const Text(
                  "Welcome Jiya 👋",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                const SizedBox(
                    height: 10),

                const Text(
                  "Login Successful",
                ),

                const SizedBox(
                    height: 20),

                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(
                        context);
                  },
                  icon: const Icon(
                      Icons.logout),
                  label:
                  const Text("Logout"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}