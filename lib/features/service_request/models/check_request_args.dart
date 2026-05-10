import 'package:flutter/material.dart';

class CheckRequestArgs {
  const CheckRequestArgs({
    required this.time,
    required this.date,
    required this.address,
    required this.governorate,
    required this.center,
    required this.problemDetails,
  });

  final TimeOfDay time;
  final DateTime date;
  final String address;
  final String governorate ;
  final String center ;
  final String problemDetails ;
}

