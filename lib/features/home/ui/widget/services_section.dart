import 'package:flutter/material.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/features/home/model/service_model.dart';
import 'package:herafy/features/home/ui/widget/service_item.dart';
import 'package:herafy/features/home/ui/widget/view_all.dart';

final List<ServiceModel> services = [
  ServiceModel(title: "نجارة", icon: "assets/icons/carpenter.svg" ,id: 1),
  ServiceModel(title: "تكييف", icon: "assets/icons/cleaning.svg",id: 6),
  ServiceModel(title: "سباكة", icon: "assets/icons/plumbing.svg",id: 3),
  ServiceModel(title: "كهرباء", icon: "assets/icons/electric.svg",id: 4),
];

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ViewAll(
          title: 'الخدمات',
          onTap: () {
            Navigator.pushNamed(context, Routes.allServicesScreen);
          },
        ),
        const SizedBox(height: 8),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: services.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 16,
            childAspectRatio: 0.8,
          ),

          itemBuilder: (context, index) {
            return ServiceItem(service: services[index]);
          },
        ),
      ],
    );
  }
}
