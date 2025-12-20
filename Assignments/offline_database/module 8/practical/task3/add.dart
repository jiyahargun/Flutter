import 'package:flutter/material.dart';
import 'mydb_helper.dart';

class AddNote extends StatefulWidget {
  final Map<String, dynamic>? note;

  const AddNote({super.key, this.note});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final dbHelper = MyDb.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController noteDesc = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      noteDesc.text = widget.note!['desc'];
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isEdit = widget.note != null;
    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? "Edit Note" : "Add Note")),
      body: Column(
        children: [
          TextFormField(
            controller: noteDesc,
            validator: (value) =>
                value!.isEmpty ? "Description is empty" : null,
            decoration: InputDecoration(labelText: "Description"),
            maxLines: null,
          ),
          ElevatedButton(
            onPressed: () async {
              if (noteDesc.text.isEmpty) return;
              if (isEdit) {
                await dbHelper.updateNote(widget.note!['_id'], {
                  MyDb.columnDesc: noteDesc.text,
                });
              } else {
                await dbHelper.insertNote({MyDb.columnDesc: noteDesc.text});
              }
              Navigator.pop(context, true);
            },
            child: Text(isEdit ? "Update" : "Add"),
          ),
        ],
      ),
    );
  }
}
