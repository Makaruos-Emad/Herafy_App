import 'package:flutter/material.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/features/requests/ui/widget/cost_details.dart';
import 'package:herafy/features/requests/ui/widget/request_card.dart';
import 'package:herafy/features/requests/ui/widget/service_port.dart';

class InvoiceDetailsScreenBody extends StatelessWidget {
  const InvoiceDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RequestCard(),
        SizedBox(height: 24),
        CostDetails(),
        SizedBox(height: 24),
        ServicePort(),
        Spacer(),
        CustomButton(
          onPressed: () {
            Navigator.pushNamed(context, "reportProblemScreen");
          },
          text: "الإبلاغ عن مشكلة",
        ),
      ],
    );
  }
}
