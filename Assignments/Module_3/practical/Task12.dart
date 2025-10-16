import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Toggle(), debugShowCheckedModeBanner: false));
}

class Toggle extends StatefulWidget {
  const Toggle({super.key});

  @override
  State<Toggle> createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
  bool isSwitched = false;
  String textValue = 'Switch Button is OFF';
  Color backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Toggle",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Container(
        color: backgroundColor,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                textValue,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    if (isSwitched) {
                      textValue = 'Switch Button is ON';
                      backgroundColor = Colors.blueGrey;
                    } else {
                      textValue = 'Switch Button is OFF';
                      backgroundColor = Colors.white54;
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
