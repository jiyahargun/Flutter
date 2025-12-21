import 'package:flutter/material.dart';

import '../mydb_helper.dart';

class ViewStudent extends StatelessWidget {
  final DBHelper db = DBHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("View Student")),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: db.getStudents(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No Students Available"));
          }

          final data = snapshot.data!;

          return ListView.builder(
            padding: EdgeInsets.all(12),
            itemCount: data.length,
            itemBuilder: (_, i) {
              final student = data[i];
              return Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Text(
                      student['fname'][0].toUpperCase(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    "${student['fname']} ${student['lname']}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  subtitle: Text("Faculty ID: ${student['facultyId']}"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
