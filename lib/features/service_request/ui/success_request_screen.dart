import 'package:flutter/material.dart';
import 'package:herafy/features/service_request/widget/success_request_body.dart';

class SuccessRequestScreen extends StatelessWidget {
  const SuccessRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SuccessRequestScreenBody(height: height, width: width),
    );
  }
}
