import 'package:flutter/material.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/features/home/ui/widget/app_bar_actions.dart';
import 'package:herafy/features/home/ui/widget/user_info.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar(
      {super.key, required this.fullName, required this.userImage});
  final String fullName;
  final String? userImage;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: UserInfo(
          fullName: fullName,
          userImage: userImage,
        )),
        AppBarActions(
          onNotificationPressed: () {
            Navigator.pushNamed(context, Routes.notificationsScreen);
          },
        ),
      ],
    );
  }
}
