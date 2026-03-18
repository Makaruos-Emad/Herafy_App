import 'package:flutter/material.dart';
import 'package:herafy/features/auth/ui/widgets/body_enter_code_screen.dart';
import 'package:herafy/core/widgets/custom_app_bar.dart';

class EnterCodeScreen extends StatelessWidget {
  const EnterCodeScreen({super.key, required this.phoneNumber});
final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "التحقق من الهاتف",
        onpress: (){
          Navigator.pop(context);
        },
      ),
      body: BodyEnterCodeScreen(phoneNumber: phoneNumber,),
    );
  }
}




