import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:share_plus/share_plus.dart';
import '../model/status_model.dart';
import '../service/save_status.dart';
import 'video_player_screen.dart';

class VideoScreen extends StatelessWidget {
  final List<StatusModel> videoList;
  final List<StatusModel> savedList;
  final Function(StatusModel) onSave;

  const VideoScreen({
    super.key,
    required this.videoList,
    required this.savedList,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    if (videoList.isEmpty) {
      return const Center(child: Text('No Video Status Found'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: videoList.length,
      itemBuilder: (context, index) {
        final status = videoList[index];
        return ListTile(
          leading: const Icon(Icons.videocam, size: 32),
          title: const Text('Video Status'),
          subtitle: Text(status.createdAt.toString()),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => VideoPlayerScreen(videoUrl: status.fileUrl),
              ),
            );
          },
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.share, color: Colors.blue),
                onPressed: () async {
                  final file = File(status.fileUrl);
                  if (!await file.exists()) return;
                  await Share.shareXFiles([XFile(file.path)]);
                },
              ),
              IconButton(
                icon: const Icon(Icons.download, color: Colors.green),
                onPressed: () async {
                  final result = await GallerySaver.saveVideo(
                    status.fileUrl,
                    albumName: "WhatsApp Status Saver",
                  ) ?? false;

                  if (result) {
                    SaveStatusService.saveStatus(
                      context: context,
                      status: status,
                      savedList: savedList,
                    );
                    onSave(status);
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(result ? 'Video saved' : 'Failed to save'),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
