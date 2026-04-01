import 'package:flutter/material.dart';
import 'package:herafy/features/home/model/all_services_item_model.dart';

class AllServicesItems {
  List<AllServicesItemModel> getServices() {
    return const [
      AllServicesItemModel(title: 'كهرباء', icon: Icons.flash_on_outlined),
      AllServicesItemModel(title: 'سباكة', icon: Icons.build_outlined),
      AllServicesItemModel(
        title: 'نظافة',
        icon: Icons.cleaning_services_outlined,
      ),
      AllServicesItemModel(title: 'نجارة', icon: Icons.handyman_outlined),
      AllServicesItemModel(title: 'نقاشة', icon: Icons.format_paint_outlined),
      AllServicesItemModel(title: 'تكييف', icon: Icons.ac_unit_outlined),
      AllServicesItemModel(
        title: 'نظافة',
        icon: Icons.cleaning_services_outlined,
      ),
      AllServicesItemModel(title: 'أسقف جبس', icon: Icons.layers_outlined),
    ];
  }
}
