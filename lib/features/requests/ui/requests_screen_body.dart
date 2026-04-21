import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/features/requests/ui/widget/active_requests_tab.dart';
import 'package:herafy/features/requests/ui/widget/history_requests_tab.dart';
import 'package:herafy/features/requests/ui/widget/request_tabs.dart';

class RequestsScreenBody extends StatelessWidget {
  const RequestsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Center(
                child: Text("طلباتي", style: AppTextStyles.semiBold20Black),
              ),
              const SizedBox(height: 24),

              const RequestTabs(tabs: ["الحالية", "السابقة"]),

              const SizedBox(height: 10),

              const Expanded(
                child: TabBarView(
                  children: [ActiveRequestsTab(), HistoryRequestsTab()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
