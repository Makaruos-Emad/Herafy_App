import 'package:flutter/material.dart';
import 'package:herafy/features/onboarding/model/onboarding_page_model.dart';
import 'package:herafy/features/onboarding/ui/widgets/onboarding_page_view_item.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({
    super.key,
    required this.pageController,
    required this.pages,
  });

  final PageController pageController;
  final List<OnboardingPageModel> pages;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PageView(
        controller: pageController,
        children: pages
            .map(
              (page) => OnboardingPageViewItem(
                image: page.image,
                title: page.title,
                description: page.description,
              ),
            )
            .toList(),
      ),
    );
  }
}
