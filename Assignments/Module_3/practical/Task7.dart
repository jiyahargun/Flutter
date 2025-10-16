import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Gridviewex(), debugShowCheckedModeBanner: false));
}

class Gridviewex extends StatefulWidget {
  const Gridviewex({super.key});

  @override
  State<Gridviewex> createState() => _GridviewexState();
}

class _GridviewexState extends State<Gridviewex> {
  List teching = [
    "https://www.giffywalls.in/cdn/shop/files/c101-panda-wallpaper-mural.jpg?quality=90&v=1734076167&width=1326",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSa_lCvaRhWthPhqzdc8M-GO9ytpfiWIJ05-A&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSV4r67c2c7shzEajV8Q_oF3RCDdyjwiKsMFw&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTODgMFPvesD4sJE5r_NV8wZJ6IfTNQsvJ9cQ&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQz-WLf-Qo3JCSURHOxcKP7d3ddfta6uoU58g&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSb_3PNALyTyY-y5W2C6g8lwQN6ZN6I5qeJ2A&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTk9JyPfXLEBD5PXUBl9uQ7Bq2NkpjSTy6Kbw&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoki9R3ZUSoAlXhpTy8ztSYEvTgc38xhCLcQ&s",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: teching.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 6,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return ListTile(
            title: Center(
              child: Column(
                children: [
                  Image.network(teching[index], width: 350, height: 250),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
