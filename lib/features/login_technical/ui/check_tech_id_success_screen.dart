import 'package:flutter/material.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/core/widgets/custom_app_bar.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/features/login_technical/widget/check_tech_id_success_body.dart';

class CheckTechIdSuccessScreen extends StatelessWidget {
  const CheckTechIdSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(
        title: "حالة الطلب",
        onpress: () {
          Navigator.pop(context);
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(height * 0.01),
          child: CustomButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.reportProblemScreen);
            },
            text: "تواصل مع الدعم الفني",
          ),
        ),
      ),
      body: CheckTechIdSuccessBody(height: height),
    );
  }
}
