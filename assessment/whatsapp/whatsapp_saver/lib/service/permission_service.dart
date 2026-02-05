import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  static Future<bool> requestStoragePermission(BuildContext context) async {
    if (await Permission.manageExternalStorage.isGranted) {
      return true;
    }

    final result = await Permission.manageExternalStorage.request();

    if (result.isGranted) return true;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Please allow All Files Access from settings',
        ),
      ),
    );

    await openAppSettings();
    return false;
  }
}
