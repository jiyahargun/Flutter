import 'package:flutter/material.dart';
import 'package:task_23/home.dart';
import 'package:task_23/profile.dart';
import 'package:task_23/setings.dart';

void main() {
  runApp(MaterialApp(
    home: Navigation(),
    debugShowCheckedModeBanner: false,
  ));
}

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Navigator",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("tops"),
              accountEmail: Text("tops@gmail.com"),
            ),
            showMenu(context, Icon(Icons.home), 'Home', HomeScreen()),
            showMenu(
                context, Icon(Icons.person_2_rounded), 'Profile', Profile()),
            showMenu(context, Icon(Icons.settings), 'Settings', Setings()),
          ],
        ),
      ),
    );
  }
}


showMenu(context, icon, title, screen) {
  return ListTile(
    title: Text(title),
    leading: icon,
    iconColor: Colors.black,
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );
    },
  );
}
