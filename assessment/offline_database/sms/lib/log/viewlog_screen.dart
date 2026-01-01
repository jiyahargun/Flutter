import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ViewLogsScreen extends StatefulWidget {
  @override
  State<ViewLogsScreen> createState() => _ViewLogsScreenState();
}

class _ViewLogsScreenState extends State<ViewLogsScreen> {
  String logs = "Loading...";

  @override
  void initState() {
    super.initState();
    loadLogs();
  }

  Future<void> loadLogs() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/student_log.txt');

      if (await file.exists()) {
        final contents = await file.readAsString();
        setState(() {
          logs = contents.isEmpty ? "No logs found" : contents;
        });
      } else {
        setState(() {
          logs = "Log file not found";
        });
      }
    } catch (e) {
      setState(() {
        logs = "Error loading logs: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("View Logs")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(child: Text(logs)),
      ),
    );
  }
}
