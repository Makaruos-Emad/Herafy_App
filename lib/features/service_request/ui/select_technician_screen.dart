import 'package:flutter/material.dart';
import 'package:herafy/core/widgets/custom_app_bar.dart';
import 'package:herafy/features/service_request/widget/select_tech_screen_body.dart';

class SelectTechnicianScreen extends StatelessWidget {
  const SelectTechnicianScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "أفضل السباكين"),
      body: SelectTechnicialBody(),
    );
  }
}
