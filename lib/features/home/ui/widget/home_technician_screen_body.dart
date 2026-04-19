import 'package:flutter/material.dart';
import 'package:herafy/features/home/ui/widget/earnings_card.dart';
import 'package:herafy/features/home/ui/widget/home_app_bar.dart';
import 'package:herafy/features/home/ui/widget/list_active_job_card.dart';
import 'package:herafy/features/home/ui/widget/task_item.dart';
import 'package:herafy/features/home/ui/widget/view_all.dart';

class HomeTechnicianScreenBody extends StatelessWidget {
  const HomeTechnicianScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeAppBar(),
        const SizedBox(height: 24),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: EarningsCard()),
              SliverToBoxAdapter(child: const SizedBox(height: 24)),
              SliverToBoxAdapter(child: ListActiveJobCard()),
              SliverToBoxAdapter(child: const SizedBox(height: 24)),
              SliverToBoxAdapter(child: ViewAll(title: "المهام القادمة")),
              SliverToBoxAdapter(child: const SizedBox(height: 24)),

              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => const TaskItem(),
                  childCount: 3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
