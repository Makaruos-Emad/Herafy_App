import 'package:flutter/material.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/core/widgets/custom_text_field.dart';
import 'package:herafy/features/auth/data/models/list_contry_code.dart';
import 'package:herafy/features/auth/ui/widgets/list_title_country_code.dart';

class WidgetEnterNumber extends StatefulWidget {
  const WidgetEnterNumber({super.key});

  @override
  State<WidgetEnterNumber> createState() => _WidgetEnterNumberState();
}

class _WidgetEnterNumberState extends State<WidgetEnterNumber> {
  String phoneNumber = "";
  Country selectedCountry = countries[0];
  GlobalKey<FormState> fromKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: fromKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  hintText: "ادخل رقم الهاتف",
                  textInputType: TextInputType.number,
                  textDirection: TextDirection.ltr,
                  suffixText: "   \u200E${selectedCountry.code}",
                  //\u200E دة رمز بيستخدم لتثبيت اتجاه النص من الشمال لليمين داخل سياق عربي
                  onSaved: (phoneNumber) {
                    setState(() {
                      this.phoneNumber = phoneNumber!;
                    });
                  },
                ),
              ),

              const SizedBox(width: 8),
              WidgetListTitleCountryCode(
                selectedCountry: selectedCountry,
                onCountrySelected: (country) {
                  setState(() {
                    selectedCountry = country;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 50),
          CustomButton(
            onPressed: () {
              if (fromKey.currentState!.validate()) {
                fromKey.currentState!.save();  //دي مهمة ف حتة لما ادوس  ارسال الكود بيروح واخد القيمة اللي انا كتبهتا
                print(phoneNumber);
                Navigator.pushNamed(context, Routes.enterCodeScreen, arguments: phoneNumber);
              }
            },
            text: 'أرسال الكود',
          ),
        ],
      ),
    );
  }
}
