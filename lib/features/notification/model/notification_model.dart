import 'package:flutter/material.dart';

class NotificationModel {
  final String title;
  final String time;
  final IconData icon;

  const NotificationModel({
    required this.title,
    required this.time,
    required this.icon,
  });
}
