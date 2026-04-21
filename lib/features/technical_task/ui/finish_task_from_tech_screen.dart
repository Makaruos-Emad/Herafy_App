import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/utils/app_constants.dart';
import 'package:herafy/core/widgets/base_card_container.dart';
import 'package:herafy/core/widgets/custom_app_bar.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/features/login_technical/widget/add_id_profile_tech_widget.dart';
import 'package:herafy/features/profile/widgets/turn_on_off_buttom.dart';

class FinishTaskFromTechScreen extends StatefulWidget {
  const FinishTaskFromTechScreen({super.key});

  @override
  State<FinishTaskFromTechScreen> createState() =>
      _FinishTaskFromTechScreenState();
}

class _FinishTaskFromTechScreenState extends State<FinishTaskFromTechScreen> {
  bool onChange = false;
  File? imageWork;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(
        title: "إنهاء المهمة",
        onpress: () {
          Navigator.pop(context);
        },
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(height * 0.01),
          child: CustomButton(
            onPressed: onChange == false
                ? null
                : () {
                    if (imageWork == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          margin: const EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: Colors.red,
                          content: Text(
                            "لازم ترفع صورة العمل النهائي ❌",
                            style: AppTextStyles.semiBold16White,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                      return;
                    }
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.closedTaskBackHomeScreen,
                      (route) => false,
                    );
                  },
            text: "تأكيد وإغلاق الطلب",
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kHorizontalPadding),
          child: Column(
            children: [
              AddIdProfileTechWidget(
                title: "اضغط لرفع صورة العمل النهائي",
                height: height * 0.25,
                width: width,
                icon: FontAwesomeIcons.camera,
                onImageSelected: (image) {
                  setState(() {
                    imageWork = image;
                  });
                },
              ),
              SizedBox(height: height * 0.02),
              Text(
                "يرجى توثيق العمل لضمان حقوقك",
                style: AppTextStyles.regular16GrayBlue,
              ),
              SizedBox(height: height * 0.02),
              BaseCard(
                child: Column(
                  spacing: height * 0.02,
                  children: [
                    Text(
                      "ملخص المستحقات (مصنعية فقط)",
                      style: AppTextStyles.regular16GrayBlue,
                    ),
                    Row(
                      children: [
                        Text(
                          "250 ",
                          style: AppTextStyles.bold16PrimaryColor.copyWith(
                            fontSize: width * 0.075,
                          ),
                        ),
                        Text("ج.م", style: AppTextStyles.bold16PrimaryColor),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xFFA1F7DA),
                          ),
                          child: Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.circleCheck,
                                color: Colors.green,
                              ),
                              SizedBox(width: width * 0.01),
                              Text(
                                "سعر ثابت من النظام",
                                style: AppTextStyles.semiBold16White.copyWith(
                                  fontSize: width * 0.032,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    Divider(),
                    Row(
                      spacing: width * 0.01,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.circleExclamation,
                          color: Colors.red,
                        ),
                        SizedBox(width: width * 0.01),
                        Expanded(
                          child: Text(
                            "هذا المبلغ يشمل المصنعية فقط ولا يشمل قطع الغيار. في حالة وجود فروقات يرجى التواصل مع الدعم الفني.",
                            style: AppTextStyles.regular16GrayBlue.copyWith(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              BaseCard(
                child: Row(
                  children: [
                    Text(
                      "تم استلام المبلغ كاش من العميل؟",
                      style: AppTextStyles.regular16Black,
                    ),
                    Spacer(),
                    ToggleButton(
                      onChanged: (p0) {
                        setState(() {
                          onChange = p0;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              Text(
                "يرجى تأكيد استلام المبلغ أولاً لتفعيل الزر",
                style: AppTextStyles.regular16GrayBlue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
