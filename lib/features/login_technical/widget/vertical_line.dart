
import 'package:flutter/material.dart';

class VerticalLine extends StatelessWidget {
  const VerticalLine({super.key, required this.height, required this.color});

  final double height;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: height * 0.03),
        Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          width: 3,
          height: height * 0.05,
        ),
      ],
    );
  }
}
