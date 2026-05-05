import 'package:flutter/material.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/core/utils/app_images.dart';
import 'package:herafy/features/home/ui/widget/app_bar_actions.dart';
import 'package:herafy/features/home/ui/widget/user_info.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: UserInfo()),
        AppBarActions(
          onNotificationPressed: () {
            Navigator.pushNamed(context, Routes.notificationsScreen);
          },
        ),
      ],
    );
  }
}
