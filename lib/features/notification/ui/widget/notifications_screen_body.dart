import 'package:flutter/material.dart';
import 'package:herafy/core/widgets/custom_app_bar.dart';
import 'package:herafy/features/notification/ui/widget/empty_state_widget.dart';

class NotificationsScreenBody extends StatelessWidget {
  const NotificationsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: "الإشعارات",
          onpress: () {
            Navigator.pop(context);
          },
        ),
        Expanded(child: Container(child: EmptyStateWidget())),
      ],
    );
  }
}
