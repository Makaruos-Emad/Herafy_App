import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/utils/app_constants.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/features/auth/cubit/auth_cubit/auth_cubit.dart';
import 'package:herafy/features/auth/ui/widgets/custom_pin_put_code.dart';

class BodyEnterCodeScreen extends StatefulWidget {
  const BodyEnterCodeScreen({super.key});

  @override
  State<BodyEnterCodeScreen> createState() => _BodyEnterCodeScreenState();
}

class _BodyEnterCodeScreenState extends State<BodyEnterCodeScreen> {
  GlobalKey<FormState> fromKey = GlobalKey();
  String? otp;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
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
                  "${cubit.phone}",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 60),
              Directionality(
                textDirection: TextDirection.ltr,
                child: CustomPinPut(
                  onCompleted: (value) {
                    otp = value;
                  },
                ),
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
                    // context.read<AuthCubit>().submitOtp(otp!);
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
