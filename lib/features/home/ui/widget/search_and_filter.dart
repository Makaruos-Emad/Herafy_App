import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/features/home/ui/widget/search_bar_widget.dart';

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: SearchBarWidget()),
        SizedBox(width: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.lightGrayBlue, width: 2),
          ),
          child: Center(
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.tune, size: 24, color: AppColors.lightGrayBlue),
            ),
          ),
        ),
      ],
    );
  }
}
