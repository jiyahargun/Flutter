import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class MyDb {
  static final _dbName = "notes.db";
  static final _dbVersion = 1;

  static final table = "notes";
  static final columnId = "_id";
  static final columnDesc = "desc";

  MyDb._privateConstructor();

  static final MyDb instance = MyDb._privateConstructor();

  Database? _db;

  Future<Database> get database async {
    _db ??= await _initDatabase();
    return _db!;
  }

  Future<Database> _initDatabase() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, _dbName);
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnDesc TEXT
      )
    ''');
  }

  Future<int> insertNote(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> viewNote() async {
    Database db = await database;
    return await db.query(table, orderBy: "$columnId DESC");
  }

  Future<int> deleteNote(int id) async {
    Database db = await database;
    return await db.delete(table, where: "$columnId = ?", whereArgs: [id]);
  }

  Future<int> updateNote(int id, Map<String, dynamic> row) async {
    Database db = await database;
    return await db.update(table, row, where: "$columnId = ?", whereArgs: [id]);
  }
}
