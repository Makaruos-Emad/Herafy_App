import 'package:flutter/material.dart';
import 'package:herafy/features/home/model/all_services_item_model.dart';

class AllServicesItems {
  List<AllServicesItemModel> getServices() {
    return const [
      AllServicesItemModel(
        title: 'كهرباء',
        icon: Icons.flash_on_outlined,
        id: 4,
      ),
      AllServicesItemModel(title: 'سباكة', icon: Icons.build_outlined, id: 3),
      AllServicesItemModel(
        title: 'نظافة',
        icon: Icons.cleaning_services_outlined,
        id: 2,
      ),
      AllServicesItemModel(
        title: 'نجارة',
        icon: Icons.handyman_outlined,
        id: 1,
      ),
      AllServicesItemModel(
        title: 'نقاشة',
        icon: Icons.format_paint_outlined,
        id: 7,
      ),
      AllServicesItemModel(title: 'تكييف', icon: Icons.ac_unit_outlined, id: 6),
      AllServicesItemModel(
        title: 'تركيب سيراميك',
        icon: Icons.grid_view,
        id: 8,
      ),
      AllServicesItemModel(
        title: 'أسقف جبس',
        icon: Icons.layers_outlined,
        id: 5,
      ),
    ];
  }
}
