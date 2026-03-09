import 'package:flutter/material.dart';
import 'package:herafy/features/auth/ui/widgets/login_screen_body.dart';
import 'package:herafy/core/theme/app_text_styles.dart';

class LoginNumberScreen extends StatelessWidget {
  const LoginNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        titleSpacing: 20,
        title: Align(
          alignment: Alignment.centerRight,
          child: Text('أهلاً بيك   👋', style: AppTextStyles.bold24DarkBlue),
        ),
      ),
      body: LoginScreenBody(),
    );
  }
}
