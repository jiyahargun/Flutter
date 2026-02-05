import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

class StatusModel {
  final String id;
  final String fileUrl;
  final String fileType;
  final DateTime createdAt;
  final bool isSaved;

  File? file;

  StatusModel({
    required this.id,
    required this.fileUrl,
    required this.fileType,
    required this.createdAt,
    this.isSaved = false,
    File? file,
  }) {
    this.file ??= File(fileUrl);
  }

  factory StatusModel.fromJson(Map<String, dynamic> json, String docId) {
    DateTime date;

    if (json['createdAt'] is Timestamp) {
      date = (json['createdAt'] as Timestamp).toDate();
    } else if (json['createdAt'] is String &&
        json['createdAt'].toString().isNotEmpty) {
      date = DateTime.parse(json['createdAt']);
    } else {
      date = DateTime.now();
    }

    return StatusModel(
      id: docId,
      fileUrl: json['fileUrl'] ?? '',
      fileType: json['fileType'] ?? 'image',
      createdAt: date,
      isSaved: json['isSaved'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fileUrl': fileUrl,
      'fileType': fileType,
      'createdAt': Timestamp.fromDate(createdAt),
      'isSaved': isSaved,
    };
  }

  bool get isImage => fileType == 'image';
  bool get isVideo => fileType == 'video';
}
