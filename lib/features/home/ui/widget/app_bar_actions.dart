import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:herafy/core/utils/app_images.dart';

class AppBarActions extends StatelessWidget {
  const AppBarActions({super.key, required this.onNotificationPressed});
  final Function() onNotificationPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onNotificationPressed,
          icon: SvgPicture.asset(
            Assets.imagesNotificationIcon,
            width: 28,
            height: 28,
          ),
        ),
      ],
    );
  }
}
