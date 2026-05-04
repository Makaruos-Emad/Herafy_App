import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/core/widgets/custom_app_bar.dart';
import 'package:herafy/features/auth/cubit/auth_cubit/auth_cubit.dart';
import 'package:herafy/features/auth/cubit/auth_cubit/auth_state.dart';
import 'package:herafy/features/auth/ui/widgets/login_screen_body.dart';

class LoginNumberScreen extends StatelessWidget {
  const LoginNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthEnterOtp) {
          Navigator.pushNamed(context, Routes.enterCodeScreen);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBar(title: 'أهلاً بيك   👋',onpress: () {
          Navigator.pop(context);
        },),
        body: LoginScreenBody(),
      ),
    );
  }
}
