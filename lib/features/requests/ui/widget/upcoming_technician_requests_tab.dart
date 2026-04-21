import 'package:flutter/material.dart';
import 'package:herafy/features/requests/ui/widget/upcoming_technician_requests_item.dart';

class UpcomingTechnicianRequestsTab extends StatelessWidget {
  const UpcomingTechnicianRequestsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return UpcomingTechnicianRequestsItem();
      },
    );
  }
}
