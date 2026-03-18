import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/font_weight_helper.dart';

class AppTextStyles {
  static const String fontFamily = "Almarai";

  static const TextStyle regular16PrimaryColor = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeightHelper.regular,
    fontSize: 16,
    color: AppColors.primaryColor,
  );

  static const TextStyle bold24DarkBlue = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeightHelper.bold,
    fontSize: 24,
    color: AppColors.darkBlue,
  );

  static const TextStyle regular16GrayBlue = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeightHelper.regular,
    fontSize: 16,
    color: AppColors.grayBlue,
  );

  static const TextStyle regular16Black = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeightHelper.regular,
    fontSize: 16,
    color: AppColors.black,
  );

  static const TextStyle regular12PrimaryColor = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeightHelper.regular,
    fontSize: 12,
    color: AppColors.primaryColor,
  );

  static const TextStyle regular12Black = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeightHelper.regular,
    fontSize: 12,
    color: AppColors.black,
  );

  static const TextStyle semiBold16White = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeightHelper.semiBold,
    fontSize: 18,
    color: AppColors.white,
  );

  static const TextStyle semiBold20Black = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeightHelper.semiBold,
    fontSize: 20,
    color: AppColors.black,
  );
}
