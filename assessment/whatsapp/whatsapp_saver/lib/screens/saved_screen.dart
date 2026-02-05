import 'package:flutter/material.dart';

import '../constant/constant.dart';
import '../model/status_model.dart';
import '../tab_screen/image_full_screen.dart';
import '../tab_screen/video_player_screen.dart';

class SavedScreen extends StatefulWidget {
  final List<StatusModel> savedList;

  // Receive saved statuses
  const SavedScreen({
    super.key,
    required this.savedList,
  });

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  void _deleteStatus(StatusModel status) {
    setState(() {
      widget.savedList.removeWhere((s) => s.id == status.id);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Status deleted successfully'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final savedList = widget.savedList;

    if (savedList.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Saved Status'),
          backgroundColor: kPrimary,
        ),
        body: const Center(
          child: Text(
            'No Saved Status Found',
            style: TextStyle(color: kGrey),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Status'),
        backgroundColor: kPrimary,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(kPaddingM),
        itemCount: savedList.length,
        itemBuilder: (context, index) {
          final status = savedList[index];

          return Card(
            margin: const EdgeInsets.only(bottom: kSpaceM),
            child: ListTile(
              leading: Icon(
                status.fileType == 'image'
                    ? Icons.image
                    : Icons.videocam,
                color: kPrimary,
              ),
              title: Text(
                status.fileType == 'image'
                    ? 'Image Status'
                    : 'Video Status',
              ),
              subtitle: Text(
                status.createdAt.toString(),
                style: const TextStyle(fontSize: 12),
              ),
              onTap: () {
                if (status.fileType == 'image') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ImageFullScreen(
                        imageUrl: status.fileUrl,
                      ),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => VideoPlayerScreen(
                        videoUrl: status.fileUrl,
                      ),
                    ),
                  );
                }
              },
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: kRed),
                onPressed: () => _showDeleteDialog(status),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showDeleteDialog(StatusModel status) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Status'),
        content: const Text(
          'Are you sure you want to delete this status?',
        ),
        actions: [
          TextButton(
            child: const Text('No'),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text(
              'Yes',
              style: TextStyle(color: kRed),
            ),
            onPressed: () {
              _deleteStatus(status);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
