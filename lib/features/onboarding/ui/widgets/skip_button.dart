import 'package:flutter/material.dart';
import 'package:herafy/core/services/shared_preferences_singleton.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/utils/app_constants.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {
            Prefs.setBool(kIsOnboardingSeen, true);
            Navigator.pushReplacementNamed(context, "/loginNumberScreen");
          },
          child: Text("تخطي", style: AppTextStyles.regular16PrimaryColor),
        ),
      ],
    );
  }
}
