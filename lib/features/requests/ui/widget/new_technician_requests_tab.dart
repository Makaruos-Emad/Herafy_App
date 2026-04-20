import 'package:flutter/material.dart';
import 'package:herafy/features/requests/model/new_technician_requests_model.dart';
import 'package:herafy/features/requests/ui/widget/new_technician_requests_Item.dart';

class NewTechnicianRequestsTab extends StatelessWidget {
  const NewTechnicianRequestsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<NewTechnicianRequestsModel> requests = [
      NewTechnicianRequestsModel(
        title: "تصليح غسالة",
        location: "شارع النصر، القاهرة",
        distance: "2 كم",
        dateTime: "اليوم 3:00 م",
        price: "150",
        onTap: () {
          // Handle tap
        },
      ),
      NewTechnicianRequestsModel(
        title: "صيانة تكييف",
        location: "شارع الهرم، الجيزة",
        distance: "5 كم",
        dateTime: "غدًا 10:00 ص",
        price: "200",
        onTap: () {
          // Handle tap
        },
      ),
    ];
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return NewTechnicianRequestsItem(
          newTechnicianRequestsModel: requests[index],
        );
      },
    );
  }
}
