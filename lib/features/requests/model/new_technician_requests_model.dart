import 'package:flutter/material.dart';

class NewTechnicianRequestsModel {
  final String title;
  final String location;
  final String distance;
  final String dateTime;
  final String price;
  final VoidCallback onTap;

  NewTechnicianRequestsModel({
    required this.title,
    required this.location,
    required this.distance,
    required this.dateTime,
    required this.price,
    required this.onTap,
  });
}
