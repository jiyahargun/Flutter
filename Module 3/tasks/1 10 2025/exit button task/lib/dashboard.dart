import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = TextButton(
      child: Text("YES"),
      onPressed: () {
        exit(0);
        Navigator.of(context).pop();
      },
    );

    Widget okButton2 = TextButton(
      child: Text("NO"),
      onPressed: () {
        //exit(0);
        Navigator.of(context).pop();
      },
    );
    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Exit "),
      content: Text("Do You want to Exit"),
      actions: [okButton, okButton2],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final alert = await showAlertDialog(context);
        return alert;
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Welcome")),
        body: Center(child: Text("Second Screen")),
      ),
    );
  }
}
