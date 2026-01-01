import 'package:flutter/material.dart';
import 'package:sms/database/mydb_helper.dart';
import 'package:sms/log/logservice.dart';

class ViewStudent extends StatefulWidget {
  @override
  State<ViewStudent> createState() => _ViewStudentState();
}

class _ViewStudentState extends State<ViewStudent> {
  final DBHelper db = DBHelper();

  Future<void> _deleteStudent(int studentId, String fname, String lname) async {
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
      await db.deleteStudent(studentId);
      await LogService.writeLog(
        "Student Deleted: $fname $lname (ID $studentId)",
      );
      setState(() {}); // Refresh UI after deletion
    }
  }

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
            return Center(child: Text("No students found"));
          }

          final data = snapshot.data!;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, i) {
              final s = data[i];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: ListTile(
                  title: Text("${s['fname']} ${s['lname']}"),
                  subtitle: Text("Faculty ID: ${s['facultyId']}"),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () =>
                        _deleteStudent(s['id'], s['fname'], s['lname']),
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
