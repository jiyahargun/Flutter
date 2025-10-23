import 'package:flutter/material.dart';
import 'package:routing/screen1.dart';
import 'package:routing/screen2.dart';
import 'package:routing/screen3.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Drawer Task',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Tops'),
              accountEmail: Text('Tops@gmail.com'),
            ),
            showMenu(context, Icon(Icons.home), 'Home', screenone()),
            showMenu(context, Icon(Icons.supervised_user_circle_outlined), 'Profile', screentwo()),
            showMenu(context, Icon(Icons.settings), 'Settings', screenthree()),
          ],
        ),
      ),
    );
  }
}

 showMenu( context, Icon icon, String title, Widget screen) {
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
