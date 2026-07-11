import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/core/widgets/custom_text_form_field.dart';
import 'package:herafy/features/auth/cubit/auth_cubit/auth_cubit.dart';
import 'package:herafy/features/auth/cubit/auth_cubit/auth_state.dart';

class WidgetEnterNumber extends StatefulWidget {
  const WidgetEnterNumber({super.key});

  @override
  State<WidgetEnterNumber> createState() => _WidgetEnterNumberState();
}

class _WidgetEnterNumberState extends State<WidgetEnterNumber> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _submitPhone() {
    if (!_formKey.currentState!.validate()) return;

    context.read<AuthCubit>().submitPhone(_phoneController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: "ادخل رقم الهاتف",
            hintStyle: AppTextStyles.semiBold20Black,
            textInputType: TextInputType.phone,
            textDirection: TextDirection.ltr,
            validator: phoneValidator,
            suffixText: " 20+",
            controller: _phoneController,
          ),
          const SizedBox(height: 32),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              final isLoading = state is AuthLoading;

              return CustomButton(
                onPressed: isLoading ? null : _submitPhone,
                text: 'متابعة',
                child: isLoading
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : null,
              );
            },
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
