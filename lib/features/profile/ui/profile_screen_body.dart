import 'package:flutter/material.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/utils/app_images.dart';
import 'package:herafy/core/widgets/custom_button.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
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
              Routes.loginNumberScreen,
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
                  backgroundImage: Image.asset(Assets.imagesUserImage).image,
                ),
                Column(
                  spacing: 5,
                  children: [
                    Text("محمد علي", style: AppTextStyles.semiBold20Black),
                    Text("012XXXXXXXX", style: AppTextStyles.regular16GrayBlue),
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
                    BuildItem(
                      title: "تعديل البيانات",
                      icon: Icons.person,
                      onTap: () {
                        Navigator.pushNamed(context, Routes.editProfileScreen);
                      },
                    ),
                    Divider(),
                    BuildItem(
                      title: "الاشعارات",
                      icon: Icons.notifications,
                      buttom: const ToggleButton(),
                      onTap: () {},
                    ),
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
                child: BuildItem(
                  title: "المساعدة",
                  icon: Icons.headset_mic,
                  iconColor: Colors.red,
                  backgroundIconColor: const Color.fromARGB(255, 230, 200, 210),
                  onTap: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildItem extends StatelessWidget {
  const BuildItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.buttom,
    this.backgroundIconColor,
    this.iconColor,
  });
  final String title;
  final IconData icon;
  final void Function() onTap;
  final Widget? buttom;
  final Color? backgroundIconColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            spacing: 10,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: backgroundIconColor ?? AppColors.primaryColor,
                child: Icon(icon, color: iconColor ?? Colors.white),
              ),
              Text(title, style: AppTextStyles.semiBold20Black),
              Spacer(),
              buttom != null
                  ? buttom!
                  : Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.primaryColor,
                    ),
            ],
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}

class ToggleButton extends StatefulWidget {
  const ToggleButton({super.key});

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool isActive = false; // حالة الزرار

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isActive = !isActive; // تغيير الحالة
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 70,
        height: 35,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: isActive ? Colors.blue : Colors.grey[400],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Align(
          alignment: isActive ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 25,
            height: 25,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
