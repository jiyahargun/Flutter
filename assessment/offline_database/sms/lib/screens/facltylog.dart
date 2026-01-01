import 'package:flutter/material.dart';
import 'package:sms/database/mydb_helper.dart';

class FacultyLogs extends StatefulWidget {
  final int facultyId;
  const FacultyLogs({super.key, required this.facultyId});

  @override
  State<FacultyLogs> createState() => _FacultyLogsState();
}

class _FacultyLogsState extends State<FacultyLogs> {
  final dbHelper = DBHelper();
  List<Map<String, dynamic>> logs = [];

  @override
  void initState() {
    super.initState();
    fetchLogs();
  }

  void fetchLogs() async {
    final fetchedLogs = await dbHelper.getLogsByFaculty(widget.facultyId);
    setState(() {
      logs = fetchedLogs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Faculty Logs')),
      body: ListView.builder(
        itemCount: logs.length,
        itemBuilder: (context, index) {
          final log = logs[index];
          return ListTile(
            title: Text(log['action']),
            subtitle: Text(log['timestamp']),
          );
        },
      ),
    );
  }
}
