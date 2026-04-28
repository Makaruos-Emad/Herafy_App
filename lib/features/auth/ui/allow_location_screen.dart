import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/utils/app_constants.dart';
import 'package:herafy/core/utils/app_images.dart';
import 'package:herafy/core/widgets/custom_app_bar.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/features/auth/logic/get_location_logic.dart';

class AllowLocationScreen extends StatelessWidget {
  const AllowLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Column(
            children: [
              CustomAppBar(
                title: "",
                onpress: () {
                  Navigator.pop(context);
                },
              ),
              SvgPicture.asset(Assets.imagesAllowLocation),
              Text(
                "تفعيل الموقع الجغرافي",
                style: AppTextStyles.bold24DarkBlue,
                textAlign: TextAlign.center,
              ),
              Text(
                "عشان نقدر نوصلك بأقرب فني ليك في أسرع وقت، من فضلك اسمح للتطبيق بتحديد موقعك الحالي بدقة.",
                style: AppTextStyles.regular16GrayBlue,
                textAlign: TextAlign.center,
              ),
              Spacer(),
              CustomButton(
                onPressed: () {
                  getLocation();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.homeClientScreen,
                    (route) => false,
                  );
                },
                text: "السماح بالوصول للموقع",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
