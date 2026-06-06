import 'package:flutter/material.dart';
import 'package:herafy/features/requests/model/requests_model.dart';
import 'package:herafy/features/requests/ui/widget/history_technician_requests_item.dart';

class HistoryTechnicianRequestsTab extends StatelessWidget {
  const HistoryTechnicianRequestsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<RequestsModel> historyTechnicianRequests = [
      RequestsModel(
        id: 3,
        title: "صيانة مروحه",
        icon: Icons.design_services,
        status: "مكتمل",
        time: DateTime.now(),
        price: 150,
      ),
      RequestsModel(
        id: 3,
        title: "صيانة باب",
        icon: Icons.web,
        status: "مكتمل",
        time: DateTime.now().subtract(Duration(days: 2)),
        price: 500,
      ),
    ];
    return ListView.builder(
      itemCount: historyTechnicianRequests.length,
      itemBuilder: (context, index) {
        return HistoryTechnicianRequestsItem(
          request: historyTechnicianRequests[index],
        );
      },
    );
  }
}
