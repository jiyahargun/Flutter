import 'package:flutter/material.dart';

import 'mydb_helper.dart';

class AddFaculty extends StatelessWidget {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final DBHelper db = DBHelper();

  Widget buildInputBox({required Widget child}) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Faculty")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            buildInputBox(
              child: TextField(
                controller: nameCtrl,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: InputBorder.none,
                ),
              ),
            ),
            buildInputBox(
              child: TextField(
                controller: emailCtrl,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: InputBorder.none,
                ),
              ),
            ),
            buildInputBox(
              child: TextField(
                controller: passCtrl,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await db.addFaculty(
                    nameCtrl.text,
                    emailCtrl.text,
                    passCtrl.text,
                  );
                  Navigator.pop(context);
                },
                child: Text("Add Faculty"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
