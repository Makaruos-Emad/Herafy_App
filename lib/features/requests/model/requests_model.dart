import 'package:flutter/material.dart';

class RequestsModel {
  final String id;
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
}
