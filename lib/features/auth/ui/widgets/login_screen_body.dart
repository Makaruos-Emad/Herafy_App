import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:herafy/core/utils/app_constants.dart';
import 'package:herafy/core/utils/app_images.dart';
import 'package:herafy/features/auth/ui/widgets/widget_enter_number.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Form(
            child: Column(
              children: [
                SvgPicture.asset(Assets.imagesLoginMobileNumber),
                WidgetEnterNumber(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
