import 'package:flutter/material.dart';
import '../constant/constant.dart';
import '../model/status_model.dart';
import 'iamge_screen.dart';
import 'video_screen.dart';

class StatusTabBar extends StatefulWidget {
  final List<StatusModel> imageList;
  final List<StatusModel> videoList;

  const StatusTabBar({
    super.key,
    required this.imageList,
    required this.videoList,
  });

  @override
  State<StatusTabBar> createState() => _StatusTabBarState();
}

class _StatusTabBarState extends State<StatusTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<StatusModel> savedList = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleSave(StatusModel status) {
    if (!savedList.contains(status)) {
      setState(() {
        savedList.add(status);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimary,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(icon: Icon(Icons.image), text: 'Images'),
            Tab(icon: Icon(Icons.videocam), text: 'Videos'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ImageScreen(
            imageList: widget.imageList,
            savedList: savedList,
            onSave: _handleSave,
          ),
          VideoScreen(
            videoList: widget.videoList,
            savedList: savedList,
            onSave: _handleSave,
          ),
        ],
      ),
    );
  }
}
