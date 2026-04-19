import 'package:flutter/material.dart';
import 'package:herafy/features/requests/ui/widget/time_line_item.dart';

class RequestTimeline extends StatelessWidget {
  const RequestTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        TimelineItem(
          title: "تم قبول الطلب",
          subtitle: "منذ 30 دقيقة",
          isDone: true,
          color: Colors.green,
        ),
        TimelineItem(
          title: "الفني في الطريق إليك",
          subtitle: "يصل خلال 15 دقيقة",
          isDone: true,
          color: Colors.blue,
        ),
        TimelineItem(
          title: "بدء العمل",
          subtitle: "",
          isDone: false,
          color: Colors.grey,
          isLast: true,
        ),
      ],
    );
  }
}
