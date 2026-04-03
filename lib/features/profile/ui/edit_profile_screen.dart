import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/widgets/custom_app_bar.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/core/widgets/custom_text_form_field.dart';
import 'package:herafy/features/auth/ui/widgets/add_image_profile_widget.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "تعديل البيانات ",
        onpress: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddImageProfileWidget(),
              Text("الاسم بالكامل", style: AppTextStyles.semiBold20Black),
              CustomTextFormField(
                hintText: " ادخل الاسم كما يظهر في الهوية",
                hintStyle: AppTextStyles.regular16GrayBlue,
                prefixIcon: const FaIcon(FontAwesomeIcons.user),
                textInputType: TextInputType.name,
              ),

              Text("رقم الهاتف", style: AppTextStyles.semiBold20Black),
              CustomTextFormField(
                hintText: "أدخل رقم هاتفك هنا",
                hintStyle: AppTextStyles.regular16GrayBlue,
                prefixIcon: const FaIcon(FontAwesomeIcons.phone),
                textInputType: TextInputType.phone,
              ),
              SizedBox(height: 20),
              CustomButton(onPressed: () {}, text: "حفظ التعديلات"),
            ],
          ),
        ),
      ),
    );
  }
}