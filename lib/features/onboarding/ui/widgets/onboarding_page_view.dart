import 'package:flutter/material.dart';
import 'package:herafy/core/utils/app_images.dart';
import 'package:herafy/features/onboarding/ui/widgets/onboarding_page_view_item.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PageView(
        controller: pageController,
        children: [
          OnboardingPageViewItem(
            image: Assets.imagesOnboardingImageOne,
            title: "صنايعية محترفين.. بضغطة زر",
            description:
                "اطلب سباك، كهربائي، أو نجار شاطر يجيلك لحد باب البيت في الوقت اللي يناسبك.",
          ),
          OnboardingPageViewItem(
            image: Assets.imagesOnboardingImageTwo,
            title: "وفر وقتك.. ومجهودك",
            description:
                "صيانة سريعة ومضمونة في ميعادها. تابع طلبك لحظة بلحظة من أول ما الفني يتحرك لحد ما يوصلك.",
          ),
          OnboardingPageViewItem(
            image: Assets.imagesOnboardingImageThree,
            title:
                "%"
                "خدمة مضمونة.. وأمان 100",
            description:
                "كل الفنيين عندنا مسجلين ومختبرين فنياً وأمنياً عشان تضمن راحة بالك وأمان بيتك.",
          ),
        ],
      ),
    );
  }
}
