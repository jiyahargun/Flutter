import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper instance = DBHelper._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _openDB();
    return _database!;
  }

  Future<Database> _openDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, "todo.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE task (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT)",
        );
      },
    );
  }

  Future<void> insertTask(Map<String, dynamic> data) async {
    final db = await database;
    await db.insert("task", data);
  }

  Future<List<Map<String, dynamic>>> queryAllTasks() async {
    final db = await database;
    return await db.query("task", orderBy: "id DESC");
  }

  Future<void> updateTask(Map<String, dynamic> data) async {
    final db = await database;
    await db.update(
      "task",
      {"title": data["title"], "description": data["description"]},
      where: "id = ?",
      whereArgs: [data["id"]],
    );
  }

  Future<void> deleteTask(int id) async {
    final db = await database;
    await db.delete("task", where: "id = ?", whereArgs: [id]);
  }
}
