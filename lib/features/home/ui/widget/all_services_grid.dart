import 'package:flutter/material.dart';
import 'package:herafy/core/utils/app_constants.dart';
import 'package:herafy/features/home/model/all_services_item_model.dart';
import 'package:herafy/features/home/ui/widget/all_service_item.dart';

class AllServicesGrid extends StatelessWidget {
  final List<AllServicesItemModel> services;

  const AllServicesGrid({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      itemCount: services.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 24,
        mainAxisSpacing: 16,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (context, index) {
        return AllServiceItem(service: services[index]);
      },
    );
  }
}
