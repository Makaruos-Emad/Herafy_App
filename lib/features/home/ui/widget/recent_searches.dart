import 'package:flutter/material.dart';
import 'package:herafy/features/home/ui/widget/recent_searches_item.dart';

class RecentSearches extends StatelessWidget {
  const RecentSearches({super.key});

  @override
  Widget build(BuildContext context) {
    final recentSearches = ['صيانة تكييف', 'سباكة', 'نجارة', 'كهرباء', 'نظافة'];

    return Expanded(
      child: ListView.builder(
        itemCount: recentSearches.length,
        itemBuilder: (context, index) {
          return RecentSearchesItem(recentSearches: recentSearches[index]);
        },
      ),
    );
  }
}
