import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: CheckBoxEx()));
}

class CheckBoxEx extends StatefulWidget {
  const CheckBoxEx({super.key});

  @override
  State<CheckBoxEx> createState() => _CheckBoxExState();
}

class _CheckBoxExState extends State<CheckBoxEx> {
  bool Music = false;
  bool Travelling = false;
  bool Badminton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Checkbox Example")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CheckboxListTile(
              title: Text("Music"),
              value: Music,
              onChanged: (value) {
                setState(() {
                  Music = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text("Travelling"),
              value: Travelling,
              onChanged: (value) {
                setState(() {
                  Travelling = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text("Badminton"),
              value: Badminton,
              onChanged: (value) {
                setState(() {
                  Badminton = value!;
                });
              },
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  print("Music : $Music");
                  print("Travelling : $Travelling");
                  print("Badminton : $Badminton");
                },
                child: Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
