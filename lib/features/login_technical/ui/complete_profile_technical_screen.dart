import 'package:flutter/material.dart';
import 'package:herafy/core/widgets/custom_app_bar.dart';
import 'package:herafy/features/login_technical/widget/complete_profile_technical_body.dart';

class CompleteProfileTechnicalScreen extends StatelessWidget {
  const CompleteProfileTechnicalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "اخبرنا عنك",
        onpress: () {
          Navigator.pop(context);
        },
      ),
      body: BodyCompleteTechnicalProfileScreen(),
    );
  }
}
