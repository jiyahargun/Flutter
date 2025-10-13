import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: RadioButtonEx()));
}

class RadioButtonEx extends StatefulWidget {
  const RadioButtonEx({super.key});

  @override
  State<RadioButtonEx> createState() => _RadioButtonExState();
}

enum Gender { male, female }

class _RadioButtonExState extends State<RadioButtonEx> {
  Gender _gender = Gender.female;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("RadioButton Example")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: const Text('Male'),
              leading: Radio(
                value: Gender.male,
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Female'),
              leading: Radio(
                value: Gender.female,
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value!;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
