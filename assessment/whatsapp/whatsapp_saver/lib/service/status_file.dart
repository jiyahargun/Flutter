import 'dart:io';

import '../model/status_model.dart';
import 'status_path_service.dart';

class StatusService {
  static Future<List<StatusModel>> getStatusList() async {
    final path = await getWhatsAppStatusPath();

    if (path == null) {
      return [];
    }

    final Directory directory = Directory(path);

    if (!directory.existsSync()) {
      return [];
    }

    final List<FileSystemEntity> files =
    directory.listSync(followLinks: false);

    List<StatusModel> statusList = [];

    for (final entity in files) {
      if (entity is! File) continue;

      final filePath = entity.path;
      final ext = filePath.split('.').last.toLowerCase();

      if (![
        'jpg',
        'jpeg',
        'png',
        'mp4',
        '3gp',
        'mkv',
        'mov',
      ].contains(ext)) {
        continue;
      }

      final String fileType =
      ['mp4', '3gp', 'mkv', 'mov'].contains(ext)
          ? 'video'
          : 'image';

      statusList.add(
        StatusModel(
          id: filePath,
          fileUrl: filePath,
          fileType: fileType,
          createdAt: entity.lastModifiedSync(),
        ),
      );
    }

    statusList.sort(
          (a, b) => b.createdAt.compareTo(a.createdAt),
    );

    return statusList;
  }
}
