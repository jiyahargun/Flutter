import 'package:flutter/material.dart';
import 'mydb_helper.dart';


void main() {
  runApp(MaterialApp(home: ToDo(),debugShowCheckedModeBanner: false,));
}

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  final DBHelper _dbHelper = DBHelper.instance;

  List<Map<String, dynamic>> _tasks = [];

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _refreshTasks();
  }

  Future<void> _refreshTasks() async {
    final data = await _dbHelper.queryAllTasks();
    setState(() {
      _tasks = data;
    });
  }

  void _showSnack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  void _showForm(int? id) {
    if (id != null) {
      final task = _tasks.firstWhere((e) => e['id'] == id);
      _titleController.text = task['title'];
      _descController.text = task['description'] ?? "";
    } else {
      _titleController.clear();
      _descController.clear();
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(id == null ? "Add Task" : "Edit Task"),
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: "Title"),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _descController,
                decoration: const InputDecoration(labelText: "Description"),
              ),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () async {
              if (_titleController.text.isEmpty) return;

              if (id == null) {
                await _dbHelper.insertTask({
                  "title": _titleController.text,
                  "description": _descController.text,
                });
                _showSnack("Task added successfully");
              } else {
                await _dbHelper.updateTask({
                  "id": id,
                  "title": _titleController.text,
                  "description": _descController.text,
                });
                _showSnack("Updated successfully");
              }

              _refreshTasks();
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteTask(int id) async {
    await _dbHelper.deleteTask(id);
    _refreshTasks();
    _showSnack("Deleted successfully");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("To-Do List")),
      body: _tasks.isEmpty
          ? const Center(child: Text("No tasks yet"))
          : ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              title: Text(_tasks[index]['title']),
              subtitle: Text(_tasks[index]['description'] ?? ""),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.green),
                    onPressed: () => _showForm(_tasks[index]['id']),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteTask(_tasks[index]['id']),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(null),
        child: const Icon(Icons.add),
      ),
    );
  }
}
