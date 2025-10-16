import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: TaskManager(), debugShowCheckedModeBanner: false));
}

class TaskManager extends StatefulWidget {
  @override
  State<TaskManager> createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManager> {
  List tasks = [];
  TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task Manager")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: taskController,
                    decoration: InputDecoration(
                      labelText: "Enter task",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    if (taskController.text.isNotEmpty) {
                      setState(() {
                        tasks.add(taskController.text);
                      });
                      taskController.clear();
                    }
                  },
                  child: Text("Add"),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: tasks.isEmpty
                  ? Center(child: Text("tasks"))
                  : ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return ListTile(title: Text(tasks[index]));
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
