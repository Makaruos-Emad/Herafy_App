import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/utils/app_constants.dart';
import 'package:herafy/core/widgets/custom_app_bar.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/features/login_technical/data/api_login_tech.dart';
import 'package:herafy/features/login_technical/widget/add_id_profile_tech_widget.dart';

class UploadIdTechScreen extends StatefulWidget {
  const UploadIdTechScreen({super.key});

  @override
  State<UploadIdTechScreen> createState() => _UploadIdTechScreenState();
}

class _UploadIdTechScreenState extends State<UploadIdTechScreen> {
  File? frontImage;
  File? backImage;
  final LoginTechApi api = LoginTechApi();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(
        title: "رفع الملفات",
        onpress: () => Navigator.pop(context),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: CustomButton(
            onPressed: () {
              if (frontImage == null || backImage == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    margin: const EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.red,
                    content: Text(
                      "لازم ترفع الصورتين الأول ❌",
                      style: AppTextStyles.semiBold16White,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
                return;
              }

              // 👇 جاهز للـ API
              api.addDocuments(faceImage: frontImage!, backImage: backImage!);

              Navigator.pushNamedAndRemoveUntil(context, Routes.checkTechIdSuccessScreen ,(route) => false);
            },
            text: "تأكيد وإرسال",
          ),
        ),
      ),

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.all(kHorizontalPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "أضف ملفاتك هنا",
                          style: AppTextStyles.semiBold20Black,
                        ),
                      ),

                      SizedBox(height: height * 0.01),

                      Text(
                        "من فضلك ارفع البطاقة الشخصية هنا لتحقق الدعم من هويتك",
                        style: AppTextStyles.regular16GrayBlue,
                      ),

                      SizedBox(height: height * 0.03),

                      AddIdProfileTechWidget(
                        height: height * 0.25,
                        title: "الوجه الأمامي للبطاقة\nاضغط هنا",
                        icon: FontAwesomeIcons.cloudArrowUp,
                        onImageSelected: (file) {
                          setState(() => frontImage = file);
                        },
                      ),

                      SizedBox(height: height * 0.02),

                      AddIdProfileTechWidget(
                        height: height * 0.25,
                        title: "الوجه الخلفي للبطاقة\nاضغط هنا",
                        icon: FontAwesomeIcons.cloudArrowUp,
                        onImageSelected: (file) {
                          setState(() => backImage = file);
                        },
                      ),

                      SizedBox(height: height * 0.05),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
