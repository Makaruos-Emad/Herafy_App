import 'package:flutter/material.dart';
import 'package:herafy/core/widgets/custom_app_bar.dart';
import 'package:herafy/features/auth/ui/widgets/body_complete_profile_screen.dart';

class CompleteClientProfileScreen extends StatelessWidget {
  const CompleteClientProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "اخبرنا عنك",
        onpress: () {
          Navigator.pop(context);
        },
      ),
      body: BodyCompleteClientProfileScreen(),
    );
  }
}
