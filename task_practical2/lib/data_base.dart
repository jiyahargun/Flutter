import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._internal();

  static final DatabaseHelper instance =
  DatabaseHelper._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(
      await getDatabasesPath(),
      'todo.db',
    );

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE todo(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL
          )
        ''');
      },
    );
  }

  // Insert Task
  Future<int> insertTodo(String title) async {
    final db = await database;

    return await db.insert(
      'todo',
      {
        'title': title,
      },
    );
  }

  // Get All Tasks
  Future<List<Map<String, dynamic>>> getTodos() async {
    final db = await database;

    return await db.query(
      'todo',
      orderBy: 'id DESC',
    );
  }

  // Update Task
  Future<int> updateTodo(
      int id,
      String title,
      ) async {
    final db = await database;

    return await db.update(
      'todo',
      {
        'title': title,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Delete Task
  Future<int> deleteTodo(int id) async {
    final db = await database;

    return await db.delete(
      'todo',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}