import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/features/home/data/all_services_items.dart';
import 'package:herafy/features/home/ui/widget/all_service_item.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final services = AllServicesItems().getServices();

    return Column(
      children: [
        Text("الخدمات", style: AppTextStyles.bold24DarkBlue),
        const SizedBox(height: 8),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: services.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 16,
            mainAxisSpacing: 24,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return AllServiceItem(service: services[index]);
          },
        ),
      ],
    );
  }
}
