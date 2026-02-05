import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';

import '../model/status_model.dart';
import '../service/save_status.dart';
import '../service/share_file.dart';
import 'image_full_screen.dart';

class ImageScreen extends StatelessWidget {
  final List<StatusModel> imageList;
  final List<StatusModel> savedList;
  final Function(StatusModel) onSave;

  const ImageScreen({
    super.key,
    required this.imageList,
    required this.savedList,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    if (imageList.isEmpty) {
      return const Center(
        child: Text(
          'No Image Status Found',
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: imageList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final status = imageList[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    ImageFullScreen(imageUrl: status.fileUrl),
              ),
            );
          },
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.file(
                    status.file!,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  bottom: 6,
                  right: 6,
                  child: Row(
                    children: [
                      _iconCard(
                        icon: Icons.download,
                        iconColor: Colors.green,
                        onTap: () async {
                          final result =
                              await GallerySaver.saveImage(
                                status.fileUrl,
                                albumName:
                                "WhatsApp Status Saver",
                              ) ??
                                  false;

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
                              content: Text(
                                result
                                    ? 'Image saved successfully'
                                    : 'Failed to save image',
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(width: 6),
                      _iconCard(
                        icon: Icons.share,
                        iconColor: Colors.blue,
                        onTap: () {
                          ShareStatusService.shareStatus(status);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _iconCard({
    required IconData icon,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Card(
        elevation: 4,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Icon(
            icon,
            size: 20,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
