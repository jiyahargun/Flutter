import 'package:flutter/material.dart';
import 'package:teadiary/colors/colors.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final Widget titleWidget;
  final List<Widget>? actions;
  final bool centerTitle;
  final bool showLeading;

  const AppHeader({
    super.key,
    required this.titleWidget,
    this.actions,
    this.centerTitle = true,
    this.showLeading = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: showLeading,
      title: titleWidget,
      centerTitle: centerTitle,
      backgroundColor: CustomColors.primaryColor,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 23,
        fontWeight: FontWeight.w500,
      ),
      iconTheme: const IconThemeData(color: Colors.white, size: 28),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
