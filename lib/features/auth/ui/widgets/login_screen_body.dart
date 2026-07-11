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
      child: LayoutBuilder(
        builder: (context, constraints) {
          final horizontalPadding = constraints.maxWidth < 360
              ? 12.0
              : kHorizontalPadding;
          final imageHeight = (constraints.maxHeight * 0.42).clamp(
            190.0,
            360.0,
          );

          return SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: imageHeight,
                      width: double.infinity,
                      child: SvgPicture.asset(
                        Assets.imagesLoginMobileNumber,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight < 650 ? 24 : 40),
                    const WidgetEnterNumber(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
