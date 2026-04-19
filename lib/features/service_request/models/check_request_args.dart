import 'package:flutter/material.dart';

class CheckRequestArgs {
  const CheckRequestArgs({
    required this.time,
    required this.date,
    required this.address,
    required this.governorate,
    required this.center,
  });

  final TimeOfDay time;
  final DateTime date;
  final String address;
  final String governorate ;
  final String center ;
}

