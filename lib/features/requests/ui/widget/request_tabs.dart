import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';

class RequestTabs extends StatelessWidget {
  const RequestTabs({super.key, required this.tabs});
  final List<String> tabs;
  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      labelColor: AppColors.white,
      unselectedLabelColor: AppColors.black,
      dividerColor: Colors.transparent,
      tabs: tabs.map((tab) => Tab(text: tab)).toList(),
    );
  }
}
