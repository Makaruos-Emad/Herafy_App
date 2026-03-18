import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({
    super.key,
    required this.currentPage,
    required this.length,
    required this.pageController,
  });

  final int currentPage;
  final int length;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          length,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: EdgeInsets.symmetric(horizontal: 4),
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              color: currentPage == index
                  ? AppColors.primaryColor
                  : AppColors.lightGray,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}
