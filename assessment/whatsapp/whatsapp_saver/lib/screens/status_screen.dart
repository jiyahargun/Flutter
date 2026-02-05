import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:whatsapp_saver/service/save_status.dart';

import '../constant/constant.dart';
import '../model/status_model.dart';
import '../service/status_file.dart';
import 'saved_screen.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  List<StatusModel> statusList = [];
  List<StatusModel> savedList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadStatuses();
  }

  Future<void> _loadStatuses() async {
    final statuses = await StatusService.getStatusList();

    setState(() {
      statusList = statuses;
      isLoading = false;
    });
  }

  void _saveStatus(StatusModel status) {
    SaveStatusService.saveStatus(
      context: context,
      status: status,
      savedList: savedList,
    );

    setState(() {}); // Refresh UI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp Status'),
        backgroundColor: kPrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.save_alt),
            onPressed: () {
              // Navigate to saved statuses
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SavedScreen(savedList: savedList),
                ),
              );
            },
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
        padding: const EdgeInsets.all(kPaddingM),
        itemCount: statusList.length,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: kSpaceM,
          mainAxisSpacing: kSpaceM,
        ),
        itemBuilder: (context, index) {
          final status = statusList[index];

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: kLightGrey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: status.fileType == 'image'
                      ? Image.file(
                    File(status.fileUrl),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  )
                      : const Center(
                    child: Icon(
                      Icons.videocam,
                      size: 40,
                      color: kGrey,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: IconButton(
                    icon: const Icon(
                      Icons.download,
                      color: kGreen,
                    ),
                    onPressed: () async {
                      bool result = false;

                      // Save to gallery first
                      if (status.fileType == 'image') {
                        result =
                            await GallerySaver.saveImage(
                              status.fileUrl,
                              albumName:
                              "WhatsApp Status Saver",
                            ) ??
                                false;
                      } else {
                        result =
                            await GallerySaver.saveVideo(
                              status.fileUrl,
                              albumName:
                              "WhatsApp Status Saver",
                            ) ??
                                false;
                      }

                      if (result) {
                        _saveStatus(status); // Save in app list
                      }

                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        SnackBar(
                          content: Text(
                            result
                                ? 'Status saved successfully'
                                : 'Failed to save status',
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
