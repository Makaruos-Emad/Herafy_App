import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/widgets/custom_app_bar.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/features/profile/helper/save_id_client_in_storge.dart';
import 'package:herafy/features/service_request/cubit/cubit_technical_details/technical_details_cubit.dart';
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
    required this.problemDetails,
  });
  final TimeOfDay time;
  final DateTime date;
  final String address;
  final String governorate;
  final String center;
  final String problemDetails;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final formattedDate = DateFormat('d MMMM yyyy', 'ar').format(date);
    final formattedTime = time.format(context);
    final detailsTechnical = details;

    return BlocProvider(
      create: (context) => TechnicalDetailsCubit(),
      child: Scaffold(
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
                        ProviderCard(
                          width: width,
                          details: detailsTechnical ?? {'': ''},
                        ),
                        const SizedBox(height: 10),

                        ServiceDetailsCard(
                          width: width,
                          height: height,
                          formattedDate: formattedDate,
                          formattedTime: formattedTime,
                          address: address,
                          governorate: governorate,
                          center: center,
                          problemDetails: problemDetails,
                          price: detailsTechnical!['inspectedPrice'] ?? 0,
                          serviceType:
                              detailsTechnical['serviceCategory'] ?? '',
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),

                CustomButton(
                  onPressed: () async {
                    final clientId = await getIdClient();
                    await TechnicalDetailsCubit().addOrder(
                      clientId: clientId ?? '',
                      serviceId: 1,
                      city: center,
                      government: governorate,
                      placeDetails: address,
                      problemDetails: problemDetails,
                      scheduledDate: date,
                      scheduledTime: time,
                      inspectedPrice: detailsTechnical["inspectedPrice"] ?? 0,
                    );
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
      ),
    );
  }
}
