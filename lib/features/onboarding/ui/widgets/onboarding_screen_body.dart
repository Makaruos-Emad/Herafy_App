import 'package:flutter/material.dart';
import 'package:herafy/features/onboarding/ui/widgets/skip_button.dart';

class OnboardingScreenBody extends StatelessWidget {
  const OnboardingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [SkipButton()],
    );
  }
}
