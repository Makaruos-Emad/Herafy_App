import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_text_styles.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({super.key, required this.title, this.onpress});
  final String title;
  VoidCallback? onpress;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        onPressed: onpress,
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
      ),
      title: Align(child: Text(title, style: AppTextStyles.semiBold16Black)),
      actions: [SizedBox(width: 50)],
    );
  }
}
