import 'package:flutter/material.dart';
import 'package:task_practical2/data_base.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() =>
      _TodoScreenState();
}

class _TodoScreenState
    extends State<TodoScreen> {

  final TextEditingController controller =
  TextEditingController();

  List<Map<String, dynamic>> todoList = [];

  @override
  void initState() {
    super.initState();
    loadTodos();
  }

  Future<void> loadTodos() async {
    todoList =
    await DatabaseHelper.instance.getTodos();

    setState(() {});
  }

  Future<void> addTodo() async {
    if (controller.text.trim().isEmpty) {
      return;
    }

    await DatabaseHelper.instance.insertTodo(
      controller.text,
    );

    controller.clear();

    loadTodos();
  }

  Future<void> deleteTodo(int id) async {
    await DatabaseHelper.instance.deleteTodo(id);

    loadTodos();
  }

  void showEditDialog(
      int id,
      String oldTitle,
      ) {
    TextEditingController editController =
    TextEditingController(
      text: oldTitle,
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Task"),
          content: TextField(
            controller: editController,
          ),
          actions: [
            TextButton(
              onPressed: () async {
                await DatabaseHelper.instance
                    .updateTodo(
                  id,
                  editController.text,
                );

                Navigator.pop(context);

                loadTodos();
              },
              child: const Text("Update"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Enter Task",
                border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: addTodo,
                child: const Text(
                  "Add Task",
                ),
              ),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context, index) {

                  return Card(
                    elevation: 3,

                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          "${index + 1}",
                        ),
                      ),

                      title: Text(
                        todoList[index]['title'],
                      ),

                      trailing: Row(
                        mainAxisSize:
                        MainAxisSize.min,
                        children: [

                          IconButton(
                            onPressed: () {
                              showEditDialog(
                                todoList[index]['id'],
                                todoList[index]
                                ['title'],
                              );
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.blue,
                            ),
                          ),

                          IconButton(
                            onPressed: () {
                              deleteTodo(
                                todoList[index]['id'],
                              );
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}