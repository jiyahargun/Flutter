import 'dart:io';

Future<String?> getWhatsAppStatusPath() async {
  final paths = [
    '/storage/emulated/0/Android/media/com.whatsapp/WhatsApp/Media/.Statuses',
    '/storage/emulated/0/WhatsApp/Media/.Statuses',
  ];

  for (final path in paths) {
    if (await Directory(path).exists()) {
      return path;
    }
  }
  return null;
}
