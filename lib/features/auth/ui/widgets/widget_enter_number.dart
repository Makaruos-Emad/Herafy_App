import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/core/widgets/custom_text_form_field.dart';
import 'package:herafy/features/auth/cubit/auth_cubit/auth_cubit.dart';

class WidgetEnterNumber extends StatelessWidget {
  const WidgetEnterNumber({super.key});

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static String _phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  hintText: "ادخل رقم الهاتف",
                  hintStyle: AppTextStyles.semiBold20Black,
                  textInputType: TextInputType.number,
                  textDirection: TextDirection.ltr,
                  validator: phoneValidator,
                  suffixText: " 20+",
                  //\u200E دة رمز بيستخدم لتثبيت اتجاه النص من الشمال لليمين داخل سياق عربي
                  onSaved: (phoneNumber) {
                    _phoneNumber = phoneNumber ?? "";
                  },
                ),
              ),

              const SizedBox(width: 8),
            ],
          ),
          SizedBox(height: 50),
          CustomButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!
                    .save(); //دي مهمة ف حتة لما ادوس  ارسال الكود بيروح واخد القيمة اللي انا كتبهتا
                print(_phoneNumber);
                context.read<AuthCubit>().submitPhone(_phoneNumber);
              }
            },
            text: 'أرسال الكود',
          ),
        ],
      ),
    );
  }
}

String? phoneValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "من فضلك ادخل رقم الموبايل";
  }

  final phone = value.trim();

  // لازم يكون أرقام فقط
  final isDigitsOnly = RegExp(r'^[0-9]+$').hasMatch(phone);
  if (!isDigitsOnly) {
    return "رقم الموبايل لازم يكون أرقام فقط";
  }

  // لازم 11 رقم
  if (phone.length != 11) {
    return "رقم الموبايل لازم يكون 11 رقم";
  }

  // لازم يبدأ بـ 01
  if (!phone.startsWith("01")) {
    return "رقم الموبايل لازم يبدأ بـ 01";
  }

  return null;
}
