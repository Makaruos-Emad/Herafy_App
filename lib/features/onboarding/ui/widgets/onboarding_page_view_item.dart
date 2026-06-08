import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:herafy/core/theme/app_text_styles.dart';

class OnboardingPageViewItem extends StatelessWidget {
  const OnboardingPageViewItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final imageHeight = (constraints.maxHeight * 0.48).clamp(190.0, 360.0);
        final imageWidth = (constraints.maxWidth * 0.9).clamp(240.0, 420.0);
        final contentSpacing = (constraints.maxHeight * 0.055).clamp(
          24.0,
          48.0,
        );
        final descriptionPadding = (constraints.maxWidth * 0.06).clamp(
          16.0,
          28.0,
        );

        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  image,
                  fit: BoxFit.contain,
                  height: imageHeight,
                  width: imageWidth,
                ),
                SizedBox(height: contentSpacing),
                Text(
                  title,
                  style: AppTextStyles.bold24DarkBlue,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: descriptionPadding),
                  child: Text(
                    description,
                    style: AppTextStyles.regular16GrayBlue,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
