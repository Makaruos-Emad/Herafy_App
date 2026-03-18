import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/utils/app_constants.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/core/widgets/custom_text_form_field.dart';
import 'package:herafy/features/auth/models/list_contry.dart';
import 'package:herafy/features/auth/ui/widgets/add_image_profile_widget.dart';
import 'package:herafy/features/auth/ui/widgets/custom_list_title.dart';

class BodyCompleteProfileScreen extends StatelessWidget {
  const BodyCompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kHorizontalPadding),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AddImageProfileWidget(),
                  SizedBox(height: 30),
                  Text(
                    "الاسم بالكامل",
                    style: AppTextStyles.semiBold20Black,
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    hintText: " ادخل الاسم كما يظهر في الهوية",
                    hintStyle: AppTextStyles.regular16GrayBlue,
                    prefixIcon: const FaIcon(FontAwesomeIcons.user),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "المحافظة",
                    style: AppTextStyles.semiBold20Black,
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 10),
                  CustomListTitle(
                    listItems: governorates,
                    leadingIcon: const Icon(Icons.location_city),
                    placeholderText: "اختار محافظة من فضلك",
                    onCountrySelected: (country) {
                      print(country);
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          SafeArea(
            top: false,
            child: CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.allowLocationScreen);
              },
              text: 'استمرار',
            ),
          ),
        ],
      ),
    );
  }
}
