import 'package:flutter/material.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/widgets/custom_app_bar.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/features/service_request/widget/check_screen_widget/provider_card_widget.dart';
import 'package:herafy/features/service_request/widget/check_screen_widget/service_details_card.dart';
import 'package:intl/intl.dart';

class CheckRequestScreen extends StatelessWidget {
  const CheckRequestScreen({
    super.key,
    required this.time,
    required this.date,
    required this.address,
    required this.governorate,
    required this.center,
  });
  final TimeOfDay time;
  final DateTime date;
  final String address;
  final String governorate;
  final String center;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final formattedDate = DateFormat('d MMMM yyyy', 'ar').format(date);
    final formattedTime = time.format(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: "تأكيد الطلب",
        onpress: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProviderCard(width: width),
                      const SizedBox(height: 10),

                      ServiceDetailsCard(
                        width: width,
                        height: height,
                        formattedDate: formattedDate,
                        formattedTime: formattedTime,
                        address: address,
                        governorate: governorate,
                        center: center,
                      ),
                    ],
                  ),
                ),
              ),

              CustomButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.successRequestScreen);
                },
                text: "تأكيد الطلب",
              ),

              const SizedBox(height: 10),

              CustomButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                text: "الغاء",
                backgroundColor: Colors.white,
                textStyle: AppTextStyles.regular16PrimaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
