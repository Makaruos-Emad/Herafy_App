import 'package:flutter/material.dart';
import 'package:herafy/core/utils/app_constants.dart';
import 'package:herafy/core/widgets/custom_app_bar.dart';
import 'package:herafy/features/requests/ui/widget/report_problem_screen_body.dart';

class ReportProblemScreen extends StatelessWidget {
  const ReportProblemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Column(
            children: [
              CustomAppBar(
                title: "الإبلاغ عن مشكلة",
                onpress: () {
                  Navigator.pop(context);
                },
              ),
              ReportProblemScreenBody(),
            ],
          ),
        ),
      ),
    );
  }
}
