import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/features/profile/cubit/profile_cubit.dart';
import 'package:herafy/features/profile/cubit/profile_state.dart';
import 'package:herafy/features/profile/widgets/turn_on_off_buttom.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key, required this.accepteRequest});
  final bool accepteRequest;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ProfileSuccess) {
          final data = state.profile;
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
                            data["profileImageURL"] ?? "",
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
                            data["fullName"] ?? "",
                            style: AppTextStyles.semiBold20Black,
                          ),
                          Text(
                            data["phoneNumber"] ?? "",
                            style: AppTextStyles.regular16GrayBlue,
                            textDirection: TextDirection.ltr,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "إعدادات الحساب",
                    style: AppTextStyles.regular16GrayBlue,
                  ),
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
                              Navigator.pushNamed(
                                context,
                                Routes.editProfileScreen,
                              );
                            },
                          ),
                          Divider(),
                          BuildButtomTurnOnOffItem(
                            title: "الاشعارات",
                            icon: Icons.notifications,
                            buttom: ToggleButton(
                              onChanged: (value) {
                                print(value);
                              },
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
                                onChanged: (value) {
                                  print(value);
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
    
                  Text(
                    "الدعم والمساعدة",
                    style: AppTextStyles.regular16GrayBlue,
                  ),
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
                        backgroundIconColor: const Color.fromARGB(
                          255,
                          230,
                          200,
                          210,
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.reportProblemScreen,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    
        if (state is ProfileError) {
          return Center(child: Text(state.error));
        }
        return const SizedBox();
      },
    );
  }
}
