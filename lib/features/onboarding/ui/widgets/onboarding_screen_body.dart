import 'package:flutter/material.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/core/services/shared_preferences_singleton.dart';
import 'package:herafy/core/utils/app_constants.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/core/widgets/dots_indicator.dart';
import 'package:herafy/features/onboarding/data/onboarding_pages.dart';
import 'package:herafy/features/onboarding/ui/widgets/onboarding_page_view.dart';
import 'package:herafy/features/onboarding/ui/widgets/skip_button.dart';

class OnboardingScreenBody extends StatefulWidget {
  const OnboardingScreenBody({super.key});

  @override
  State<OnboardingScreenBody> createState() => _OnboardingScreenBodyState();
}

class _OnboardingScreenBodyState extends State<OnboardingScreenBody> {
  late final PageController _pageController;

  var _currentPage = 0;
  int get _lastPageIndex => onboardingPages.length - 1;

  @override
  void initState() {
    _pageController = PageController();

    _pageController.addListener(() {
      final page = _pageController.page;
      if (page == null) return;

      final nextPage = page.round();
      if (nextPage != _currentPage) {
        setState(() {
          _currentPage = nextPage;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _finishOnboarding() {
    Prefs.setBool(kIsOnboardingSeen, true);
    Navigator.pushReplacementNamed(context, Routes.loginNumberScreen);
  }

  void _goToNextPage() {
    if (_currentPage == _lastPageIndex) {
      _finishOnboarding();
      return;
    }

    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenHeight = constraints.maxHeight;
        final bottomSpacing = (screenHeight * 0.025).clamp(12.0, 24.0);
        final actionSpacing = (screenHeight * 0.02).clamp(12.0, 18.0);

        return Column(
          children: [
            SkipButton(onPressed: _finishOnboarding),
            Expanded(
              child: OnboardingPageView(
                pageController: _pageController,
                pages: onboardingPages,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: bottomSpacing),
              child: Column(
                children: [
                  DotsIndicator(
                    currentPage: _currentPage,
                    length: onboardingPages.length,
                    pageController: _pageController,
                  ),
                  SizedBox(height: actionSpacing),
                  CustomButton(onPressed: _goToNextPage, text: "التالي"),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
