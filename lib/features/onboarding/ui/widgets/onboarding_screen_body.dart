import 'package:flutter/material.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/core/services/shared_preferences_singleton.dart';
import 'package:herafy/core/utils/app_constants.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/core/widgets/dots_indicator.dart';
import 'package:herafy/features/onboarding/ui/widgets/onboarding_page_view.dart';
import 'package:herafy/features/onboarding/ui/widgets/skip_button.dart';

class OnboardingScreenBody extends StatefulWidget {
  const OnboardingScreenBody({super.key});

  @override
  State<OnboardingScreenBody> createState() => _OnboardingScreenBodyState();
}

class _OnboardingScreenBodyState extends State<OnboardingScreenBody> {
  static const int _pagesCount = 3;
  late final PageController pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Future<void> _finishOnboarding() async {
    await Prefs.setBool(kIsOnboardingSeen, true);
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, Routes.userTypeSelectionScreen);
  }

  void _goToNextPage() {
    if (currentPage == _pagesCount - 1) {
      _finishOnboarding();
      return;
    }

    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final horizontalPadding = constraints.maxWidth < 360
            ? 12.0
            : kHorizontalPadding;
        final bottomSpacing = constraints.maxHeight < 680 ? 12.0 : 20.0;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            children: [
              SkipButton(onPressed: _finishOnboarding),
              Expanded(
                child: OnboardingPageView(
                  pageController: pageController,
                  onPageChanged: (index) {
                    setState(() => currentPage = index);
                  },
                ),
              ),
              SafeArea(
                top: false,
                child: Padding(
                  padding: EdgeInsets.only(bottom: bottomSpacing),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DotsIndicator(
                        currentPage: currentPage,
                        length: _pagesCount,
                        pageController: pageController,
                      ),
                      const SizedBox(height: 16),
                      CustomButton(
                        onPressed: _goToNextPage,
                        text: currentPage == _pagesCount - 1
                            ? "ابدأ الآن"
                            : "التالي",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
