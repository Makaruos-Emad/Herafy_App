import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:herafy/core/theme/app_colors.dart';
import '../../data/navigation_items.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.white,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.lightGrayBlue,
      showUnselectedLabels: true,
      items: navigationItems.map((item) {
        return BottomNavigationBarItem(
          icon: SvgPicture.asset(item.icon),
          activeIcon: SvgPicture.asset(item.activeIcon),
          label: item.label,
        );
      }).toList(),
    );
  }
}
