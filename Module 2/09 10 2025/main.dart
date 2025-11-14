import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: SwitchScreen()));
}

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.scale(
              scale: 2,
              child: Switch(
                onChanged: (value) {
                  toggleSwitch(value);
                },
                value: isSwitched,
                activeColor: Colors.redAccent,
                activeTrackColor: Colors.grey,
                inactiveThumbColor: Colors.redAccent,
                inactiveTrackColor: Colors.blueGrey,
              ),
            ),
            SizedBox(height: 50),
            Text('$textValue', style: TextStyle(fontSize: 50)),
          ],
        ),
      ),
    );
  }

  toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }
}
