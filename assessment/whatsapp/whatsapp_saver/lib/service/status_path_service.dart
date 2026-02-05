import 'dart:io';

Future<String?> getWhatsAppStatusPath() async {
  final paths = [
    // Android 11+
    '/storage/emulated/0/Android/media/com.whatsapp/WhatsApp/Media/.Statuses',

    '/storage/emulated/0/WhatsApp/Media/.Statuses',
  ];

  for (final path in paths) {
    final dir = Directory(path);
    if (await dir.exists()) {
      return path;
    }
  }
  return null;
}
