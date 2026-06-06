import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key, required this.userImage});
  final String? userImage;

  @override
  Widget build(BuildContext context) {
    final hasUserImage = userImage != null && userImage!.trim().isNotEmpty;

    return CircleAvatar(
      radius: 22,
      backgroundColor: AppColors.primaryColor,
      child: CircleAvatar(
        radius: 20,
        backgroundImage: hasUserImage ? NetworkImage(userImage!) : null,
        child: hasUserImage ? null : const Icon(Icons.person),
      ),
    );
  }
}
