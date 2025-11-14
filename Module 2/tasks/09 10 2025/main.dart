import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MaterialApp(home: SwitchScreen(), debugShowCheckedModeBanner: false));
}

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void toggleSwitch(bool value) async {
    if (!isSwitched) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });

      await _audioPlayer.setReleaseMode(ReleaseMode.loop);
      await _audioPlayer.play(AssetSource('duck.mp3'));

      print('Music ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });


      await _audioPlayer.stop();

      print('Music OFF');
    }
  }

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
                onChanged: toggleSwitch,
                value: isSwitched,
                activeColor: Colors.black,
                activeTrackColor: Colors.redAccent,
                inactiveThumbColor: Colors.greenAccent,
                inactiveTrackColor: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              textValue,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
