import 'package:flutter/material.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/utils/app_constants.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/features/auth/ui/widgets/custom_pin_put_code.dart';

class BodyEnterCodeScreen extends StatefulWidget {
  const BodyEnterCodeScreen({super.key, required this.phoneNumber});
  final String? phoneNumber;
  @override
  State<BodyEnterCodeScreen> createState() => _BodyEnterCodeScreenState();
}

class _BodyEnterCodeScreenState extends State<BodyEnterCodeScreen> {
  GlobalKey<FormState> fromKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kHorizontalPadding,
          vertical: 16,
        ),
        child: Form(
          key: fromKey,
          child: Column(
            textDirection: TextDirection.ltr,
            children: [
              Center(
                child: Text(
                  "تم ارسال كود التحقق الى الرقم   \n"
                  "${widget.phoneNumber}",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 60),
              Directionality(
                textDirection: TextDirection.ltr,
                child: CustomPinPut(),
              ),
              SizedBox(height: 10),

              Row(
                children: [
                  Text("لم يصلك الكود؟"),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "إعادة الإرسال",
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40),

              CustomButton(
                onPressed: () {
                  if (fromKey.currentState!.validate()) {
                    print("success");
                    Navigator.pushNamed(context, navigateRoute(false));
                  }
                },
                text: 'تأكيد',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String navigateRoute(bool isUser) {
  if (isUser) {
    return Routes.completeProfileScreen;
  } else {
    return Routes.completeTechnicialProfileScreen;
  }
}
