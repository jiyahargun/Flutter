import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

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
        // Counsellor table
        await db.execute('''
        CREATE TABLE counsellor(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          email TEXT,
          password TEXT
        )
        ''');

        // Default Counsellor
        await db.insert('counsellor', {
          'email': 'admin@gmail.com',
          'password': 'admin123',
        });

        // Faculty table
        await db.execute('''
        CREATE TABLE faculty(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          email TEXT,
          password TEXT
        )
        ''');

        // Student table
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

        // Attendance table
        await db.execute('''
        CREATE TABLE attendance(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          studentId INTEGER,
          present INTEGER
        )
        ''');
      },
    );
  }

  // -LOGIN -

  Future<bool> counsellorLogin(String email, String pass) async {
    final database = await db;
    var res = await database.query(
      'counsellor',
      where: 'email=? AND password=?',
      whereArgs: [email, pass],
    );
    return res.isNotEmpty;
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

  // - FACULTY -

  Future<int> addFaculty(String name, String email, String pass) async {
    final database = await db;
    return await database.insert('faculty', {
      'name': name,
      'email': email,
      'password': pass,
    });
  }

  Future<List<Map<String, dynamic>>> getFaculty() async {
    final database = await db;
    return await database.query('faculty');
  }

  // - STUDENT -

  Future<int> addStudent(Map<String, dynamic> data) async {
    final database = await db;
    return await database.insert('student', data);
  }

  Future<List<Map<String, dynamic>>> getStudents() async {
    final database = await db;
    return await database.query('student');
  }

  // -STUDENTS BY FACULTY -

  Future<List<Map<String, dynamic>>> getStudentsByFaculty(int facultyId) async {
    final database = await db;
    return database.query(
      'student',
      where: 'facultyId = ?',
      whereArgs: [facultyId],
    );
  }

  // - UPDATE MARKS -

  Future<void> updateStudentMarks(int studentId, String marks) async {
    final database = await db;
    await database.update(
      'student',
      {'marks': marks},
      where: 'id = ?',
      whereArgs: [studentId],
    );
  }
}
