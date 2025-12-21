import 'package:flutter/material.dart';

import 'logiin.dart';
import 'mydb_helper.dart';

class FacultyDashboard extends StatefulWidget {
  final int facultyId;

  FacultyDashboard({required this.facultyId});

  @override
  State<FacultyDashboard> createState() => _FacultyDashboardState();
}

class _FacultyDashboardState extends State<FacultyDashboard> {
  final DBHelper db = DBHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Faculty Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => LoginScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: db.getStudentsByFaculty(widget.facultyId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No students assigned'));
          }

          final students = snapshot.data!;

          return ListView.builder(
            padding: EdgeInsets.all(12),
            itemCount: students.length,
            itemBuilder: (_, index) {
              final student = students[index];
              final marksController = TextEditingController(
                text: student['marks'].toString(),
              );

              return Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${student['fname']} ${student['lname']}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text('Email: ${student['email']}'),
                      SizedBox(height: 6),
                      Text('Course: ${student['course']}'),
                      SizedBox(height: 6),
                      Text('City: ${student['city']}'),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: marksController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Marks',
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () async {
                              await db.updateStudentMarks(
                                student['id'],
                                marksController.text,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Marks Updated')),
                              );
                              setState(() {}); // Refresh
                            },
                            child: Text('Save'),
                          ),
                        ],
                      ),
                    ],
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
