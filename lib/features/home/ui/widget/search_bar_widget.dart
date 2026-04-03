import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/utils/app_images.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.searchScreen);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.lightGrayBlue, width: 2),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: SvgPicture.asset(Assets.imagesSearchIcon),
            ),
            Expanded(
              child: Text(
                'ابحث عن خدمة...',
                style: AppTextStyles.regular12Black.copyWith(
                  color: AppColors.lightGrayBlue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
