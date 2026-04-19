import 'package:flutter/material.dart';
import 'package:herafy/features/requests/model/requests_model.dart';
import 'package:herafy/features/requests/ui/widget/requests_item.dart';

class HistoryRequestsTab extends StatelessWidget {
  const HistoryRequestsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<RequestsModel> previousRequests = [
      RequestsModel(
        id: "#2541",
        title: "صيانة تكييف",
        icon: Icons.design_services,
        status: "مكتمل",
        time: DateTime.now(),
        price: 150,
      ),
      RequestsModel(
        id: "#2542",
        title: "صيانة حوض",
        icon: Icons.web,
        status: "مكتمل",
        time: DateTime.now().subtract(Duration(days: 2)),
        price: 500,
      ),
    ];
    return ListView.builder(
      itemCount: previousRequests.length,
      itemBuilder: (context, index) {
        return RequestsItem(request: previousRequests[index]);
      },
    );
  }
}
