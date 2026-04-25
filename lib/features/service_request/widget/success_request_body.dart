import 'package:flutter/material.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/utils/app_images.dart';
import 'package:herafy/core/widgets/custom_button.dart';

class SuccessRequestScreenBody extends StatelessWidget {
  const SuccessRequestScreenBody({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: height * 0.01,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                Assets.imagesSeccessfulPng,
                height: height * 0.4,
                width: width * 0.8,
              ),
              Text(
                "تم إرسال الطلب بنجاح!",
                style: AppTextStyles.semiBold20Black.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              Text(
                "تم إبلاغ الفني بالموعد، سيقوم بتأكيد الطلب خلال 10 دقائق.",
                style: AppTextStyles.regular16GrayBlue,
              ),
              const Spacer(),
              CustomButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.requestTrackerScreen);
                },
                text: "تتبع الطلب",
              ),
              CustomButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.homeClientScreen,
                    (route) => false,
                  );
                },
                text: "الصفحة الرئيسية",
                backgroundColor: Colors.white,
                side: const BorderSide(color: AppColors.primaryColor),
                textStyle: AppTextStyles.semiBold16White.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
