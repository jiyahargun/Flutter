import 'package:flutter/material.dart';
import '../model/status_model.dart';

class SaveStatusService {
  static void saveStatus({
    required BuildContext context,
    required StatusModel status,
    required List<StatusModel> savedList,
  }) {
    // control statement
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
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Status saved successfully')),
    );
  }
}
