import 'package:flutter/material.dart';
import 'package:whatsapp_saver/constant/constant.dart';
import 'package:whatsapp_saver/screens/download_screen.dart';
import 'package:whatsapp_saver/tab_screen/iamge_screen.dart';
import 'package:whatsapp_saver/tab_screen/video_screen.dart';
import '../model/status_model.dart';
import '../service/status_file.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  List<StatusModel> statusImages = [];
  List<StatusModel> statusVideos = [];
  bool isLoading = true;

  late TabController _tabController;

  final List<StatusModel> savedList = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _fetchStatus();
  }

  Future<void> _fetchStatus() async {
    final allStatus = await StatusService.getStatusList();
    setState(() {
      statusImages = allStatus.where((s) => s.fileType == 'image').toList();
      statusVideos = allStatus.where((s) => s.fileType == 'video').toList();
      isLoading = false;
    });
  }

  void _handleSave(StatusModel status) {
    if (!savedList.any((e) => e.fileUrl == status.fileUrl)) {
      setState(() {
        savedList.add(status);
      });
    }
  }

  void _handleDelete(StatusModel status) {
    setState(() {
      savedList.removeWhere(
            (e) => e.fileUrl == status.fileUrl,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Status Saver'),
        backgroundColor: kPrimary,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(icon: Icon(Icons.image), text: 'Images'),
            Tab(icon: Icon(Icons.videocam), text: 'Videos'),
            Tab(icon: Icon(Icons.download), text: 'Downloads'),
          ],
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : TabBarView(
        controller: _tabController,
        children: [
          ImageScreen(
            imageList: statusImages,
            savedList: savedList,
            onSave: _handleSave,
          ),
          VideoScreen(
            videoList: statusVideos,
            savedList: savedList,
            onSave: _handleSave,
          ),
          DownloadsScreen(
            savedList: savedList,
            onDelete: _handleDelete,
          ),
        ],
      ),
    );
  }
}
