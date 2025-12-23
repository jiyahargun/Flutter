import 'package:flutter/material.dart';
import 'package:sms/database/mydb_helper.dart';
import 'package:sms/log/logservice.dart';

class ViewStudent extends StatelessWidget {
  final DBHelper db = DBHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("View Student")),
      body: FutureBuilder(
        future: db.getStudents(),
        builder: (_, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          final data = snapshot.data as List<Map<String, dynamic>>;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, i) {
              final s = data[i];
              return Card(
                child: ListTile(
                  title: Text("${s['fname']} ${s['lname']}"),
                  subtitle: Text("Faculty ID: ${s['facultyId']}"),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      bool confirm = await showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text("Confirm Delete"),
                          content: Text("Delete this student?"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: Text("No"),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, true),
                              child: Text("Yes"),
                            ),
                          ],
                        ),
                      );

                      if (confirm) {
                        await db.deleteStudent(s['id']);
                        await LogService.writeLog(
                          "Student Deleted ID ${s['id']}",
                        );
                      }
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
