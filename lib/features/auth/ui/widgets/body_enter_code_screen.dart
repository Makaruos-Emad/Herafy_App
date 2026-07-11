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
  final GlobalKey<FormState> fromKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          final horizontalPadding = constraints.maxWidth < 360
              ? 12.0
              : kHorizontalPadding;

          return SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: 16,
                ),
                child: Form(
                  key: fromKey,
                  child: Column(
                    textDirection: TextDirection.ltr,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "تم ارسال كود التحقق الى الرقم\n${cubit.phone ?? ""}",
                          style: const TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: constraints.maxHeight < 650 ? 32 : 60),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: const CustomPinPut(),
                      ),
                      const SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Flexible(child: Text("لم يصلك الكود؟")),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "إعادة الإرسال",
                              style: TextStyle(color: AppColors.primaryColor),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: constraints.maxHeight < 650 ? 24 : 40),

                      CustomButton(
                        onPressed: () {
                          if (!fromKey.currentState!.validate()) return;

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "التحقق بالكود غير متصل بالخادم حالياً",
                              ),
                            ),
                          );
                        },
                        text: 'تأكيد',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
