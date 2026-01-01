import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDb();
    return _db!;
  }

  Future<Database> initDb() async {
    String path = join(await getDatabasesPath(), 'college.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE counsellor(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            email TEXT,
            password TEXT
          )
        ''');

        await db.insert('counsellor', {
          'email': 'admin@gmail.com',
          'password': 'admin123',
        });

        await db.execute('''
          CREATE TABLE faculty(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            email TEXT,
            password TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE student(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            fname TEXT,
            lname TEXT,
            email TEXT,
            course TEXT,
            address TEXT,
            pincode TEXT,
            city TEXT,
            totalFees TEXT,
            contact TEXT,
            marks TEXT,
            facultyId INTEGER
          )
        ''');

        await db.execute('''
          CREATE TABLE attendance(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            studentId INTEGER,
            present INTEGER
          )
        ''');

        await db.execute('''
          CREATE TABLE log(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            facultyId INTEGER,
            action TEXT,
            timestamp TEXT
          )
        ''');
      },
    );
  }

  Future<bool> counsellorLogin(String email, String password) async {
    final database = await db;
    final result = await database.query(
      'counsellor',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    return result.isNotEmpty;
  }

  Future<bool> facultyLogin(String email, String password) async {
    final database = await db;
    final result = await database.query(
      'faculty',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    return result.isNotEmpty;
  }

  Future<int> addFaculty(String name, String email, String password) async {
    final database = await db;
    return await database.insert('faculty', {
      'name': name,
      'email': email,
      'password': password,
    });
  }

  Future<List<Map<String, dynamic>>> getFaculty() async {
    final database = await db;
    return await database.query('faculty');
  }

  Future<int> addStudent(Map<String, dynamic> data) async {
    final database = await db;
    return await database.insert('student', data);
  }

  Future<List<Map<String, dynamic>>> getStudents() async {
    final database = await db;
    return await database.query('student');
  }

  Future<List<Map<String, dynamic>>> getStudentsByFaculty(int facultyId) async {
    final database = await db;
    return await database.query(
      'student',
      where: 'facultyId = ?',
      whereArgs: [facultyId],
    );
  }

  Future<void> updateStudentMarks(int studentId, String marks) async {
    final database = await db;
    await database.update(
      'student',
      {'marks': marks},
      where: 'id = ?',
      whereArgs: [studentId],
    );
  }

  Future<void> deleteStudent(int id) async {
    final database = await db;
    await database.delete('student', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> addLog(int facultyId, String action) async {
    final database = await db;
    return await database.insert('log', {
      'facultyId': facultyId,
      'action': action,
      'timestamp': DateTime.now().toString(),
    });
  }

  Future<List<Map<String, dynamic>>> getLogsByFaculty(int facultyId) async {
    final database = await db;
    return await database.query(
      'log',
      where: 'facultyId = ?',
      whereArgs: [facultyId],
      orderBy: 'timestamp DESC',
    );
  }
}
