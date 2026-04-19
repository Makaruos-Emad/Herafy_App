import 'package:flutter/material.dart';
import 'package:herafy/features/home/ui/widget/active_job_card.dart';

class ListActiveJobCard extends StatelessWidget {
  const ListActiveJobCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 16),
        itemCount: 5,
        itemBuilder: (context, index) {
          return const ActiveJobCard();
        },
      ),
    );
  }
}
