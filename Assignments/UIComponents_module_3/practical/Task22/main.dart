import 'package:flutter/material.dart';
import 'details.dart';

void main() {
  runApp(MaterialApp(home: Home(), debugShowCheckedModeBanner: false));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Screen",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            TextField(
              controller: name,
              decoration: const InputDecoration(
                labelText: "Enter your name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: email,
              decoration: const InputDecoration(
                labelText: "Enter your email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (name.text.isNotEmpty && email.text.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Details(name: name.text, email: email.text),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please fill all fields")),
                  );
                }
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
