import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "List Example",
       home: const ListEx2(), 
    ),
  );
}

class ListEx2 extends StatefulWidget {
  const ListEx2({super.key});

  @override
  State<ListEx2> createState() => _ListEx2State();
}

class _ListEx2State extends State<ListEx2> {
  final AudioPlayer player = AudioPlayer();

  final List<String> names = [
    "Sparrow",
    "Parrot",
    "Duck",
    "Eagle",
    "Swan",
    "Peacock",
    "Panda",
    "Lion",
    "Tiger",
    "Rabbit",
    "Cat",
    "Zebra",
  ];

  final List<String> birdsImages = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_EcyrC8zLgz9RgYeKXdpHSS-rZpXsJJ-49w&s",
    "https://images.unsplash.com/photo-1686308346757-5c86f02fbb61?w=400&auto=format&fit=crop&q=60",
    "https://images.unsplash.com/photo-1556596187-c3d988ea368c?w=400&auto=format&fit=crop&q=60",
    "https://images.unsplash.com/photo-1611689342806-0863700ce1e4?w=400&auto=format&fit=crop&q=60",
    "https://images.unsplash.com/photo-1567112098492-382825853bdd?w=400&auto=format&fit=crop&q=60",
    "https://images.unsplash.com/photo-1572877183903-f6f33bbfa7c5?w=400&auto=format&fit=crop&q=60",
    "https://images.unsplash.com/photo-1527118732049-c88155f2107c?w=400&auto=format&fit=crop&q=60",
    "https://plus.unsplash.com/premium_photo-1669725687221-6fe12c2da6b1?w=400&auto=format&fit=crop&q=60",
    "https://images.unsplash.com/photo-1615824996195-f780bba7cfab?w=400&auto=format&fit=crop&q=60",
    "https://images.unsplash.com/photo-1585110396000-c9ffd4e4b308?w=400&auto=format&fit=crop&q=60",
    "https://images.unsplash.com/photo-1585110396000-c9ffd4e4b308?w=400&auto=format&fit=crop&q=60",
    "https://images.unsplash.com/photo-1526319238109-524eecb9b913?w=400&auto=format&fit=crop&q=60",
  ];

  final List<String> songs = [
    "sparow.mp3",
    "parrot.mp3",
    "duck.mp3",
    "eagle.mp3",
    "swan.mp3",
    "peacock.mp3",
    "panda.mp3",
    "lion.mp3",
    "tiger.mp3",
    "rabbit.mp3",
    "cat.mp3",
    "zebra.mp3",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Data"),
      ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(
              birdsImages[index],
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(names[index]),
            trailing: IconButton(
              icon: const Icon(Icons.music_note),
              onPressed: () {
                //player.play(AssetSource('sounds/songs[index]'));

                player.play(AssetSource('sounds/${songs[index]}'));
              },
            ),
          );
        },
      ),
    );
  }
}
