import 'package:flutter/material.dart';
import 'package:herafy/core/utils/service_icon.dart';

class OrderDetailsTechnicianModel {
  final int id;
  final String serviceName;
  final DateTime scheduledDate;
  final String scheduledTime;
  final String placeDetails;
  final String problemDetails;
  final double inspectedPrice;
  final double afterPrice;
  final double finalPrice;
  final String imageCliURL;
  final String nameClient;
  final String state;
  final IconData icon;

  OrderDetailsTechnicianModel({
    required this.id,
    required this.serviceName,
    required this.scheduledDate,
    required this.scheduledTime,
    required this.placeDetails,
    required this.problemDetails,
    required this.inspectedPrice,
    required this.afterPrice,
    required this.finalPrice,
    required this.imageCliURL,
    required this.nameClient,
    required this.state,
    required this.icon,
  });

  factory OrderDetailsTechnicianModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailsTechnicianModel(
      id: json['id'],
      serviceName: json['serviceName'] ?? '',
      scheduledDate: DateTime.parse(json['scheduledDate']),
      scheduledTime: json['scheduledTime'] ?? '',
      placeDetails: json['placeDetails'] ?? '',
      problemDetails: json['problemDetails'] ?? '',
      inspectedPrice: (json['inspectedPrice'] as num?)?.toDouble() ?? 0,
      afterPrice: (json['afterPrice'] as num?)?.toDouble() ?? 0,
      finalPrice: (json['finalPrice'] as num?)?.toDouble() ?? 0,
      imageCliURL: json['imageCliURL'] ?? '',
      nameClient: json['nameClient'] ?? '',
      state: json['state'] ?? '',
      icon: getServiceIcon(json['serviceName'] ?? ''),
    );
  }
}
