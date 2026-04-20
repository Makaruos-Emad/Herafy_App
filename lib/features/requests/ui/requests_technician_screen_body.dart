import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/features/requests/ui/widget/request_tabs.dart';

class RequestsTechnicianScreenBody extends StatelessWidget {
  const RequestsTechnicianScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Center(
                child: Text("طلباتي", style: AppTextStyles.semiBold20Black),
              ),
              const SizedBox(height: 24),
              const RequestTabs(
                tabs: ["طلبات جديدة", "مهام قادمة", "سجل العمل"],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
