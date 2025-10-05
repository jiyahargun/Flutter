import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

final player = AudioPlayer(); // global player

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animal & Birds")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Birds", style: TextStyle(fontSize: 20)),
              onPressed: () {
                _showBirdsDialog(context);
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Animals", style: TextStyle(fontSize: 20)),
              onPressed: () {
                _showAnimalsDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

enum Birds { sparrow, parrot, duck, swan, eagle }

void _showBirdsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        title: Text("Select Bird"),
        children: [
          SimpleDialogOption(
            child: Text("Sparrow"),
            onPressed: () {
              player.play(AssetSource('sounds/sparow.mp3'));
              Navigator.pop(context);
            },
          ),
          SimpleDialogOption(
            child: Text("Parrot"),
            onPressed: () {
              player.play(AssetSource('sounds/parrot.mp3'));
              Navigator.pop(context);
            },
          ),
          SimpleDialogOption(
            child: Text("Duck"),
            onPressed: () {
              player.play(AssetSource('sounds/duck.mp3'));
              Navigator.pop(context);
            },
          ),
          SimpleDialogOption(
            child: Text("Swan"),
            onPressed: () {
              player.play(AssetSource('sounds/swan.mp3'));
              Navigator.pop(context);
            },
          ),
          SimpleDialogOption(
            child: Text("Eagle"),
            onPressed: () {
              player.play(AssetSource('sounds/eagle.mp3'));
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}

enum Animals { cat, dog, lion, tiger, rabbit }

void _showAnimalsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        title: Text("Select Animal"),
        children: [
          SimpleDialogOption(
            child: Text("Cat"),
            onPressed: () {
              player.play(AssetSource('sounds/cat.mp3'));
              Navigator.pop(context);
            },
          ),
          SimpleDialogOption(
            child: Text("Dog"),
            onPressed: () {
              player.play(AssetSource('sounds/dog.mp3'));
              Navigator.pop(context);
            },
          ),
          SimpleDialogOption(
            child: Text("Lion"),
            onPressed: () {
              player.play(AssetSource('sounds/lion.mp3'));
              Navigator.pop(context);
            },
          ),
          SimpleDialogOption(
            child: Text("Tiger"),
            onPressed: () {
              player.play(AssetSource('sounds/tiger.mp3'));
              Navigator.pop(context);
            },
          ),
          SimpleDialogOption(
            child: Text("Rabbit"),
            onPressed: () {
              player.play(AssetSource('assets/sounds/rabbit.mp3'));
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
