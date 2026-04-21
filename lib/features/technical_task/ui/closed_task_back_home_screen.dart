import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/widgets/custom_button.dart';

class ClosedTaskBackHomeScreen extends StatelessWidget {
  const ClosedTaskBackHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(height * 0.01),
          child: CustomButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.homeClientScreen,
                //هنا المفروض تحط الهوم بتاعت الفنيي
                (route) => false,
              );
            },
            text: "الصفحة الرئيسية",
          ),
        ),
      ),
      body: Center(
        child: Column(
          spacing: height * 0.01,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: width * 0.15,
              backgroundColor: Color(0xFFDCFCE7),
              child: FaIcon(
                FontAwesomeIcons.circleCheck,
                size: width * 0.18,
                color: Colors.green,
              ),
            ),
            Text("تم إغلاق الطلب بنجاح", style: AppTextStyles.bold24DarkBlue),
            Text(
              "شكراً لك، تم تأكيد إتمام المهمة واستلام المبلغ.",
              style: AppTextStyles.regular16GrayBlue,
            ),
          ],
        ),
      ),
    );
  }
}
