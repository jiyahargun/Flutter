import 'package:flutter/material.dart';
import 'package:mod8/add.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MaterialApp(home: UserDataScreen(), debugShowCheckedModeBanner: false),
  );
}

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  String name = '';
  String surname = '';

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      name = pref.getString('name') ?? '';
      surname = pref.getString('surname') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Data')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: $name', style: TextStyle(fontSize: 22)),
            SizedBox(height: 15),
            Text('Surname: $surname', style: TextStyle(fontSize: 22)),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddDataScreen()),
                  );
                  loadUserData();
                },
                child: Text(
                  'ADD DATA',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
