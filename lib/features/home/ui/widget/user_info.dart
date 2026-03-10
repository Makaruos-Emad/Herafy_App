import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/features/home/ui/widget/user_avater.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key, required this.name, required this.userImage});
  final String name;
  final String userImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UserAvatar(userImage: userImage),
        SizedBox(width: 8),
        Flexible(
          child: Text(
            "اهلا، $name",
            style: AppTextStyles.bold24DarkBlue,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
