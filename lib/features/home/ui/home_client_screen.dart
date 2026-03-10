import 'package:flutter/material.dart';
import 'package:herafy/core/utils/app_constants.dart';
import 'package:herafy/features/home/ui/widget/home_client_screen_body.dart';

class HomeClientScreen extends StatelessWidget {
  const HomeClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: HomeClientScreenBody(),
        ),
      ),
    );
  }
}
