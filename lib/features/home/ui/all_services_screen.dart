import 'package:flutter/material.dart';
import 'package:herafy/core/widgets/custom_app_bar.dart';
import 'package:herafy/features/home/data/all_services_items.dart';
import 'package:herafy/features/home/ui/widget/all_services_grid.dart';

class AllServicesScreen extends StatelessWidget {
  const AllServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final services = AllServicesItems().getServices();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: "الخدمات",
              onpress: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 16),
            Expanded(child: AllServicesGrid(services: services)),
          ],
        ),
      ),
    );
  }
}
