import 'package:flutter/material.dart';
import 'package:herafy/core/utils/order_status_mapper.dart';
import 'package:herafy/core/utils/service_icon.dart';

class RequestsModel {
  final int id;
  final String title;
  final IconData icon;
  final String status;
  final DateTime time;
  final double price;

  RequestsModel({
    required this.id,
    required this.title,
    required this.icon,
    required this.status,
    required this.time,
    required this.price,
  });

  factory RequestsModel.fromJson(Map<String, dynamic> json) {
    return RequestsModel(
      id: json['id'],
      title: json['serviceName'],
      status: mapOrderStatus(json['state']),
      time: DateTime.parse(json['scheduledDate']),
      price: (json['inspectedPrice'] as num).toDouble(),
      icon: getServiceIcon(json['serviceName']),
    );
  }
}
