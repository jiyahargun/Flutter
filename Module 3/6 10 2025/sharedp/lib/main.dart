import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboard.dart';

void main() {
  runApp(MaterialApp(
    home: LoginScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late SharedPreferences sharedPreferences;
  TextEditingController uname = TextEditingController();
  TextEditingController pass = TextEditingController();
  var newuser;

  @override
  void initState() {
    super.initState();
    checkvalue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: Column(
        children: [
          SizedBox(height: 50), // space from top, adjust as needed
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: uname,
              decoration: InputDecoration(
                hintText: "Enter Username",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding:
                EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: pass,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding:
                EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              String u = uname.text.toString();
              String p = pass.text.toString();

              sharedPreferences.setBool("tops", false);
              sharedPreferences.setString("uname", u);

              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DashboardScreen()));
            },

            child: Text("Login"),
          ),
        ],
      ),
    );
  }

  checkvalue() async {
    sharedPreferences = await SharedPreferences.getInstance();
    newuser = sharedPreferences.getBool("tops") ?? true;

    if (newuser == false) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => DashboardScreen()));
    }
  }
}
