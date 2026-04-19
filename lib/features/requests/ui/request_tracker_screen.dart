import 'package:flutter/material.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/core/utils/app_constants.dart';
import 'package:herafy/core/widgets/custom_app_bar.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/core/widgets/custom_outlined_button.dart';
import 'package:herafy/features/requests/ui/widget/request_time_line.dart';
import 'package:herafy/features/requests/ui/widget/technician_card.dart';

class RequestTrackerScreen extends StatelessWidget {
  const RequestTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Column(
            children: [
              CustomAppBar(
                title: "حالة الطلب",
                onpress: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 24),
              Expanded(child: RequestTimeline()),
              const SizedBox(height: 24),
              TechnicianCard(),
              const SizedBox(height: 24),
              CustomButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.reportProblemScreen);
                },
                text: "مراسلة",
              ),
              const SizedBox(height: 16),
              CustomOutlinedButton(
                onPressed: () {
                  // بعد الالغاء
                  // Navigator.pop(context);
                },
                text: "إلغاء الطلب",
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
