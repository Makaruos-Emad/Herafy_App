import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/features/requests/cubit/technician_orders_cubit.dart';
import 'package:herafy/features/requests/ui/widget/history_technician_requests_tab.dart';
import 'package:herafy/features/requests/ui/widget/new_technician_requests_tab.dart';
import 'package:herafy/features/requests/ui/widget/request_tabs.dart';
import 'package:herafy/features/requests/ui/widget/upcoming_technician_requests_tab.dart';

class RequestsTechnicianScreenBody extends StatelessWidget {
  const RequestsTechnicianScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TechnicianOrdersCubit()..getTechnicianOrders(),
      child: DefaultTabController(
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

                const Expanded(
                  child: TabBarView(
                    children: [
                      NewTechnicianRequestsTab(),
                      UpcomingTechnicianRequestsTab(),
                      HistoryTechnicianRequestsTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
