import 'dart:io';
import 'package:flutter/material.dart';
import 'package:whatsapp_saver/tab_screen/image_full_screen.dart';
import 'package:whatsapp_saver/tab_screen/video_player_screen.dart';
import '../model/status_model.dart';

class DownloadsScreen extends StatelessWidget {
  final List<StatusModel> savedList;
  final Function(StatusModel) onDelete;

  const DownloadsScreen({
    super.key,
    required this.savedList,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    if (savedList.isEmpty) {
      return const Center(
        child: Text('No downloaded status found'),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: savedList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final status = savedList[index];

        return Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => status.isImage
                        ? ImageFullScreen(imageUrl: status.fileUrl)
                        : VideoPlayerScreen(videoUrl: status.fileUrl),
                  ),
                );
              },
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                clipBehavior: Clip.antiAlias,
                child: status.isImage
                    ? Image.file(
                  File(status.fileUrl),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                )
                    : const Center(
                  child: Icon(
                    Icons.videocam,
                    size: 50,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),

            Positioned(
              top: 6,
              right: 6,
              child: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.black54,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.delete,
                    size: 18,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    onDelete(status);
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
