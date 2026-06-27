import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/features/profile/cubit/profile_tech_cubit.dart';

import 'package:herafy/features/profile/widgets/turn_on_off_buttom.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({
    super.key,
    required this.accepteRequest,
    this.data,
    this.isLoading = false,
    this.error,
    this.technician = false,
  });
  final Map<String, dynamic>? data;
  final bool isLoading;
  final String? error;
  final bool accepteRequest;
  final bool technician;
  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (data == null) {
      return const SizedBox();
    }
    if (error != null) {
      return Center(child: Text(error!));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("حسابي", style: AppTextStyles.bold24DarkBlue),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.userTypeSelectionScreen,
              (route) => false,
            );
          },
          text: "تسجيل خروج",
          backgroundColor: Colors.red,
        ),
      ),
      body: Align(
        alignment: Alignment.topRight,
        child: Column(
          textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 10,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey.shade200,
                  child: ClipOval(
                    child: Image.network(
                      data!["profileImageURL"] ?? "",
                      width: 80,
                      height: 80,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Column(
                  spacing: 5,
                  children: [
                    Text(
                      technician ? data!["fullname"] : data!["fullName"],
                      style: AppTextStyles.semiBold20Black,
                    ),
                    Text(
                      data!["phoneNumber"] ?? "",
                      style: AppTextStyles.regular16GrayBlue,
                      textDirection: TextDirection.ltr,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text("إعدادات الحساب", style: AppTextStyles.regular16GrayBlue),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200,
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    BuildButtomTurnOnOffItem(
                      title: "تعديل البيانات",
                      icon: Icons.person,
                      onTap: () {
                        if (technician) {
                          Navigator.pushNamed(
                            context,
                            Routes.editTechnicianProfile,
                          );
                        } else {
                          Navigator.pushNamed(
                            context,
                            Routes.editProfileScreen,
                          );
                        }
                      },
                    ),
                    Divider(),
                    BuildButtomTurnOnOffItem(
                      title: "الاشعارات",
                      icon: Icons.notifications,
                      buttom: ToggleButton(
                        onChanged: (value) {},
                      ),
                      onTap: () {},
                    ),
                    if (accepteRequest) ...[
                      SizedBox(height: 10),
                      Divider(),
                      BuildButtomTurnOnOffItem(
                        title: "استقبال الطلبات",
                        icon: Icons.construction,
                        buttom: ToggleButton(
                          initialValue: data!["availabilityStatus"] ?? false,
                          onChanged: (value) {
                            context
                                .read<ProfileTechCubit>()
                                .updateAvailability(value);
                          },
                        ),
                        onTap: () {},
                      ),
                    ],
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("الدعم والمساعدة", style: AppTextStyles.regular16GrayBlue),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BuildButtomTurnOnOffItem(
                  title: "المساعدة",
                  icon: Icons.headset_mic,
                  iconColor: Colors.red,
                  backgroundIconColor: const Color.fromARGB(255, 230, 200, 210),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.reportProblemScreen);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
