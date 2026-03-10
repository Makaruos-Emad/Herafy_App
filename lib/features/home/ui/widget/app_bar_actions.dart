import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AppBarActions extends StatelessWidget {
  const AppBarActions({
    super.key,
    required this.onLocationPressed,
    required this.onNotificationPressed,
  });
  final Function() onLocationPressed;
  final Function() onNotificationPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onLocationPressed,
          icon: PhosphorIcon(
            PhosphorIcons.mapPin(),
            color: AppColors.primaryColor,
            size: 28,
          ),
        ),
        IconButton(
          onPressed: onNotificationPressed,
          icon: const Icon(
            Icons.notification_important_outlined,
            color: AppColors.primaryColor,
            size: 28,
          ),
        ),
      ],
    );
  }
}
