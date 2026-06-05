import 'package:flutter/material.dart';

IconData getServiceIcon(String serviceName) {
  switch (serviceName) {
    case "نجارة":
      return Icons.handyman;

    case "نظافة":
      return Icons.cleaning_services;

    case "سباكة":
      return Icons.plumbing;

    case "كهرباء":
      return Icons.electrical_services;

    case "اسقف جبس":
      return Icons.architecture;

    case "تكييف":
      return Icons.ac_unit;

    case "نقاشة":
      return Icons.format_paint;

    case "تركيب سراميك":
      return Icons.grid_view;

    default:
      return Icons.home_repair_service;
  }
}
