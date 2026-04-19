import 'package:flutter/material.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/core/utils/app_constants.dart';
import 'package:herafy/core/widgets/custom_app_bar.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/features/service_request/widget/tech_selected_profile_body.dart';

class TechSelectedProfileScreen extends StatelessWidget {
  const TechSelectedProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: CustomAppBar(title: "", onpress: () {
        Navigator.pop(context);
      }),
      body: TechSelectedProfileBody(),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          bottom: 20,
          left: kHorizontalPadding,
          right: kHorizontalPadding,
        ),
        color: Colors.transparent,
        child: CustomButton(onPressed: () {
          Navigator.pushNamed(context, Routes.bookAppointmentScreen);
        }, text: "طلب معاينة"),
      ),
    );
  }
}
