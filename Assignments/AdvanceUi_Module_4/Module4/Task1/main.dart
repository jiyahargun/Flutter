import 'package:flutter/material.dart';
import 'package:routing/product%20screen.dart';

void main() {
  runApp(MaterialApp(
    home: Multiplescreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class Multiplescreen extends StatefulWidget {
  const Multiplescreen({super.key});

  @override
  State<Multiplescreen> createState() => _MultiplescreenState();
}

class _MultiplescreenState extends State<Multiplescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Screen",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbf_-QUsUesz3TVTc1uldrMWx0wzoV4Ss_pK2zby0V_At_5W36SjuMaSYMfgMKUsKXBbM&usqp=CAU",
            ),
            SizedBox(height: 50),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => productscreen()),
                );
              },
              child: Text(
                "Product screen",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

