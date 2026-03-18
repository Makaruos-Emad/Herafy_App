import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:herafy/core/utils/app_images.dart';

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
          icon: SvgPicture.asset(
            Assets.imagesMapPinIcon,
            width: 28,
            height: 28,
          ),
        ),
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
