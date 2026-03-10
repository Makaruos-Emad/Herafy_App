import 'package:flutter/material.dart';
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
  late PageController pageController;

  var currentPage = 0;

  @override
  void initState() {
    pageController = PageController();

    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SkipButton(),
        Expanded(child: OnboardingPageView(pageController: pageController)),
        Column(
          children: [
            DotsIndicator(
              currentPage: currentPage,
              length: 3,
              pageController: pageController,
            ),
            const SizedBox(height: 16),
            CustomButton(
              onPressed: () {
                if (currentPage == 2) {
                  Prefs.setBool(kIsOnboardingSeen, true);
                  Navigator.pushReplacementNamed(context, "/loginNumberScreen");
                } else {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear,
                  );
                }
              },
              text: "التالي",
            ),
          ],
        ),
      ],
    );
  }
}
