import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:pinput/pinput.dart';

class CustomPinPut extends StatelessWidget {
  const CustomPinPut({super.key, this.onCompleted});
  final void Function(String)? onCompleted;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'الرجاء ادخال كود التحقق';
        }
        return null;
      },
      showCursor: false,
      defaultPinTheme: PinTheme(
        width: 80,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border.all(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        textStyle: const TextStyle(color: Colors.black, fontSize: 20),
      ),
      focusedPinTheme: PinTheme(
        width: 80,
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor),
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        textStyle: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      length: 6,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.phone,
      separatorBuilder: (index) => const SizedBox(width: 20),
      onCompleted: onCompleted,
    );
  }
}
