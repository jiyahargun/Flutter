import 'dart:io';
import 'package:path_provider/path_provider.dart';

class LogService {
  static Future<void> writeLog(String message) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final path = '${directory.path}/student_log.txt';
      final file = File(path);

      final timestamp = DateTime.now().toString();
      await file.writeAsString(
        '$timestamp - $message\n',
        mode: FileMode.append,
      );
    } catch (e) {
      print("Log Error: $e");
    }
  }
}
