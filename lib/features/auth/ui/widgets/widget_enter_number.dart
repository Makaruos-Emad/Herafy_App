import 'package:flutter/material.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/core/widgets/custom_text_form_field.dart';
import 'package:herafy/features/auth/data/country_name.dart';
import 'package:herafy/features/auth/models/list_contry.dart';
import 'package:herafy/features/auth/ui/widgets/custom_list_title.dart';

class WidgetEnterNumber extends StatelessWidget {
  const WidgetEnterNumber({super.key});

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static final ValueNotifier<Country> _selectedCountry = ValueNotifier<Country>(
    countries[0],
  );
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
                child: ValueListenableBuilder<Country>(
                  valueListenable: _selectedCountry,
                  builder: (context, selectedCountry, _) {
                    return CustomTextFormField(
                      hintText: "ادخل رقم الهاتف",
                      hintStyle: AppTextStyles.semiBold20Black,
                      textInputType: TextInputType.number,
                      textDirection: TextDirection.ltr,
                      suffixText: "   \u200E${selectedCountry.code}",
                      //\u200E دة رمز بيستخدم لتثبيت اتجاه النص من الشمال لليمين داخل سياق عربي
                      onSaved: (phoneNumber) {
                        _phoneNumber = phoneNumber ?? "";
                      },
                    );
                  },
                ),
              ),

              const SizedBox(width: 8),
              CustomListTitle<Country>(
                items: countries,
                titleBuilder: (country) => country.title,
                initialSelected: _selectedCountry.value,
                showSelectedTitle: false,
                leadingBuilder: (country) => country.flag == null
                    ? null
                    : Text(country.flag!, style: const TextStyle(fontSize: 20)),
                trailingBuilder: (country) => country.code == null
                    ? null
                    : Text(
                        country.code!,
                        textDirection: TextDirection.ltr,
                        style: const TextStyle(fontSize: 16),
                      ),
                onSelected: (country) {
                  _selectedCountry.value = country;
                },
              ),
            ],
          ),
          SizedBox(height: 50),
          CustomButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!
                    .save(); //دي مهمة ف حتة لما ادوس  ارسال الكود بيروح واخد القيمة اللي انا كتبهتا
                print(_phoneNumber);
                Navigator.pushNamed(
                  context,
                  Routes.enterCodeScreen,
                  arguments: _phoneNumber,
                );
              }
            },
            text: 'أرسال الكود',
          ),
        ],
      ),
    );
  }
}
