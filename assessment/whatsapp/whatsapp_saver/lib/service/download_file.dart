import 'dart:io';
import 'package:flutter/material.dart';
import '../model/status_model.dart';

class DownloadStatusService {
  static void downloadStatus({
    required BuildContext context,
    required StatusModel status,
    required List<StatusModel> savedList,
  }) {
    if (savedList.any((item) => item.id == status.id)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Status already saved')),
      );
      return;
    }

    savedList.add(
      StatusModel(
        id: status.id,
        fileUrl: status.fileUrl,
        fileType: status.fileType,
        createdAt: DateTime.now(),
        isSaved: true,
        file: status.file,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Status downloaded successfully')),
    );
  }
}
