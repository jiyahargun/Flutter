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
  var password = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login Form",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Enter Your Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35.00),
                ),
              ),
            ),

            SizedBox(height: 10),
            TextFormField(
              obscureText: password,
              decoration: InputDecoration(
                labelText: "Enter Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35.00),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    password ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      password = !password;
                    });
                  },
                ),
              ),
            ),

            SizedBox(height: 24),

            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Login Successfully')));
              },

              child: Text("Login", style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
