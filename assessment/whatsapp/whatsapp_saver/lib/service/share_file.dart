import 'dart:io';
import 'package:share_plus/share_plus.dart';
import '../model/status_model.dart';

class ShareStatusService {
  static Future<void> shareStatus(StatusModel status) async {
    final file = File(status.fileUrl);

    if (!await file.exists()) {
      return;
    }

    await Share.shareXFiles(
      [XFile(file.path)],
      text: 'Check out this WhatsApp Status',
    );
  }
}
