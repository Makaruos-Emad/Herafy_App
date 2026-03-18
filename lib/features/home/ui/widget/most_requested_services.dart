import 'package:flutter/material.dart';
import 'package:herafy/features/home/ui/widget/service_card.dart';
import 'package:herafy/features/home/ui/widget/view_all.dart';

class MostRequestedServices extends StatelessWidget {
  const MostRequestedServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ViewAll(title: ("الأكثر طلباً")),
        const SizedBox(height: 8),
        SizedBox(
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [ServiceCard(), ServiceCard(), ServiceCard()],
          ),
        ),
      ],
    );
  }
}
