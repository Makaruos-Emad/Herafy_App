import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/utils/app_images.dart';
import 'package:herafy/core/widgets/custom_text_field.dart';
import 'package:herafy/features/home/ui/widget/recent_searches.dart';

class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          hintText: 'ابحث عن خدمة...',
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(Assets.imagesSearchIcon),
          ),
        ),
        const SizedBox(height: 16),
        Text("عمليات البحث الأخيرة", style: AppTextStyles.regular16Black),
        const SizedBox(height: 8),
        RecentSearches(),
      ],
    );
  }
}
