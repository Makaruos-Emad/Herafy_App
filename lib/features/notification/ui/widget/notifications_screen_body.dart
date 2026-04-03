import 'package:flutter/material.dart';
import 'package:herafy/core/widgets/custom_app_bar.dart';
import 'package:herafy/features/notification/model/notification_model.dart';
import 'package:herafy/features/notification/ui/widget/empty_state_widget.dart';
import 'package:herafy/features/notification/ui/widget/notification_item.dart';

class NotificationsScreenBody extends StatelessWidget {
  const NotificationsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<NotificationModel> notifications = [
      NotificationModel(
        title: "تم تأكيد طلبك",
        time: "منذ 5 دقائق",
        icon: Icons.check_circle_outline,
      ),
      NotificationModel(
        title: "الفني وصل للموقع",
        time: "الآن",
        icon: Icons.location_on_outlined,
      ),
      NotificationModel(
        title: "عرض خاص",
        time: "منذ ساعتين",
        icon: Icons.local_offer_outlined,
      ),
      NotificationModel(
        title: "تذكير بموعد الخدمة",
        time: "منذ يوم",
        icon: Icons.notifications_none,
      ),
    ];

    return Column(
      children: [
        CustomAppBar(
          title: "الإشعارات",
          onpress: () {
            Navigator.pop(context);
          },
        ),
        Expanded(
          child: Container(
            child: notifications.isEmpty
                ? const EmptyStateWidget()
                : ListView.builder(
                    itemCount: notifications.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: NotificationItem(
                          notification: notifications[index],
                        ),
                      );
                    },
                  ),
          ),
        ),
      ],
    );
  }
}
