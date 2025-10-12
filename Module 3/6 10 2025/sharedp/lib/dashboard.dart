import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedp/main.dart';

class DashboardScreen extends StatefulWidget
{
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
{

  late SharedPreferences sharedPreferences;
  String myuser = "";

  @override
  void initState()
  {
    checkdata();
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Welcome: $myuser"),actions:
      [
        IconButton(onPressed: ()
        {
          sharedPreferences.setBool("tops", true);
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LoginScreen()));

        }, icon: Icon(Icons.logout))
      ],),
    );
  }

  checkdata()async
  {
    sharedPreferences = await SharedPreferences.getInstance();

    setState(()
    {

      myuser = sharedPreferences.getString("uname")!;

    });

  }
}
