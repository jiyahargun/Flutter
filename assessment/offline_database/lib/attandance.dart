import 'package:flutter/material.dart';
import 'mydb_helper.dart';


class AttendanceScreen extends StatelessWidget {
  final DBHelper db = DBHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Attendance")),
      body: FutureBuilder(
        future: db.getStudents(),
        builder: (_, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          final students = snapshot.data as List<Map<String, dynamic>>;
          return ListView(
            children: students.map((s) {
              return CheckboxListTile(
                title: Text("${s['fname']} ${s['lname']}"),
                value: false,
                onChanged: (v) {},
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
