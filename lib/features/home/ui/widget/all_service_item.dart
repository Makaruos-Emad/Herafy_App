import 'package:flutter/material.dart';
import 'package:herafy/features/home/model/all_services_item_model.dart';

class AllServiceItem extends StatelessWidget {
  final AllServicesItemModel service;

  const AllServiceItem({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(service.icon, color: Colors.blue, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          service.title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
