import 'package:flutter/material.dart';
import 'package:sms/database/mydb_helper.dart';

class ViewFaculty extends StatelessWidget {
  final DBHelper db = DBHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("View Faculty")),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: db.getFaculty(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No Faculty Available"));
          }

          final data = snapshot.data!;

          return ListView.builder(
            padding: EdgeInsets.all(12),
            itemCount: data.length,
            itemBuilder: (context, i) {
              final faculty = data[i];
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
                    backgroundColor: Colors.blue,
                    child: Text(
                      faculty['name'][0].toUpperCase(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    faculty['name'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  subtitle: Text("ID: ${faculty['id']}"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
