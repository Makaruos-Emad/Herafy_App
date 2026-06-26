import 'package:flutter/material.dart';
import 'package:herafy/core/utils/service_icon.dart';

class TechnicianOrderModel {
  final int id;
  final String placeDetails;
  final String problemDetails;
  final String serviceName;
  final DateTime scheduledDate;
  final String scheduledTime;
  final double inspectedPrice;
  final String imageWorkURL;
  final String state;
  final IconData icon;

  TechnicianOrderModel({
    required this.id,
    required this.placeDetails,
    required this.problemDetails,
    required this.serviceName,
    required this.scheduledDate,
    required this.scheduledTime,
    required this.inspectedPrice,
    required this.imageWorkURL,
    required this.state,
    required this.icon,
  });

  factory TechnicianOrderModel.fromJson(Map<String, dynamic> json) {
    return TechnicianOrderModel(
      id: json['id'],
      placeDetails: json['placeDetails'] ?? '',
      problemDetails: json['problemDetails'] ?? '',
      serviceName: json['serviceName'] ?? '',
      scheduledDate: DateTime.parse(json['scheduledDate']),
      scheduledTime: json['scheduledTime'] ?? '',
      inspectedPrice: (json['inspectedPrice'] ?? 0).toDouble(),
      imageWorkURL: json['imageWorkURL'] ?? '',
      state: json['state'] ?? '',
      icon: getServiceIcon(json['serviceName']),
    );
  }
}
