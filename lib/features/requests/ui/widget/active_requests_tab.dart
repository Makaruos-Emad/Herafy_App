import 'package:flutter/material.dart';
import 'package:herafy/features/requests/model/requests_model.dart';
import 'package:herafy/features/requests/ui/widget/requests_item.dart';

class ActiveRequestsTab extends StatelessWidget {
  const ActiveRequestsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<RequestsModel> currentRequests = [
      RequestsModel(
        id: "#2543",
        title: "صيانة مروحه",
        icon: Icons.design_services,
        status: "جاري التنفيذ",
        time: DateTime.now(),
        price: 150,
      ),
      RequestsModel(
        id: "#2544",
        title: "صيانة باب",
        icon: Icons.web,
        status: "موعد مؤكد",
        time: DateTime.now().subtract(Duration(days: 2)),
        price: 500,
      ),
    ];
    return ListView.builder(
      itemCount: currentRequests.length,
      itemBuilder: (context, index) {
        return RequestsItem(request: currentRequests[index]);
      },
    );
  }
}
