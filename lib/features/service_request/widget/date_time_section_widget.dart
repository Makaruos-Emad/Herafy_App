
import 'package:flutter/material.dart';
import 'package:herafy/features/service_request/widget/select_data_item.dart';
import 'package:herafy/features/service_request/widget/select_time_item.dart';

class DateTimeSection extends StatelessWidget {
  final ValueChanged<TimeOfDay?> onTimeChanged;
  final ValueChanged<DateTime?> onDateChanged;

  const DateTimeSection({
    super.key,
    required this.onTimeChanged,
    required this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Expanded(
          child: SelectTime(
            onChanged: onTimeChanged,
          ),
        ),
        SizedBox(width: width * 0.03),
        Expanded(
          child: SelectDate(
            onChanged: onDateChanged,
          ),
        ),
      ],
    );
  }
}