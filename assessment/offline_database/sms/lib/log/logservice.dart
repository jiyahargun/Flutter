
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class LogService {
  static Future<void> writeLog(String message) async {
    final directory = await getApplicationDocumentsDirectory();
    final fileDir = Directory('${directory.path}/files');

    if (!await fileDir.exists()) {
      await fileDir.create(recursive: true);
    }

    final file = File('${fileDir.path}/student_log.txt');

    final time = DateTime.now().toString();
    await file.writeAsString(
      '$time - $message\n',
      mode: FileMode.append,
    );
  }
}
