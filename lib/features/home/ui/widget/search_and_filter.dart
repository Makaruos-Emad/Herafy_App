import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/utils/app_images.dart';
import 'package:herafy/core/widgets/custom_text_field.dart';

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomTextField(
            hintText: 'ابحث عن خدمة...',
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(Assets.imagesSearchIcon),
            ),
          ),
        ),
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
