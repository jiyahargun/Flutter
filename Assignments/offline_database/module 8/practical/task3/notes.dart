import 'package:flutter/material.dart';
import 'add.dart';
import 'mydb_helper.dart';

class NotesList extends StatefulWidget {
  const NotesList({super.key});

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  final dbHelper = MyDb.instance;
  List<Map<String, dynamic>> notesList = [];

  @override
  void initState() {
    super.initState();
    viewNoteData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView.builder(
        itemCount: notesList.length,
        itemBuilder: (context, index) {
          var note = notesList[index];
          return ListTile(
            title: Text(note['desc'] ?? ""),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () async {
                    bool? updated = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddNote(note: note),
                      ),
                    );
                    if (updated == true) viewNoteData();
                  },
                  child: Icon(Icons.edit),
                ),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    deleteNoteData(note['_id']);
                  },
                  child: Icon(Icons.delete),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool? added = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNote()),
          );
          if (added == true) viewNoteData();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void viewNoteData() async {
    final allRows = await dbHelper.viewNote();
    setState(() {
      notesList = allRows;
    });
  }

  void deleteNoteData(int id) async {
    await dbHelper.deleteNote(id);
    viewNoteData();
  }
}
