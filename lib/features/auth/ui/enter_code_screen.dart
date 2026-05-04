import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/features/auth/cubit/auth_cubit/auth_cubit.dart';
import 'package:herafy/features/auth/cubit/auth_cubit/auth_state.dart';
import 'package:herafy/features/auth/ui/widgets/body_enter_code_screen.dart';
import 'package:herafy/core/widgets/custom_app_bar.dart';

class EnterCodeScreen extends StatelessWidget {
  const EnterCodeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthEnterData) {
          if (cubit.userType == UserType.technician) {
            Navigator.pushNamed(context, Routes.completeTechnicialProfileScreen);
          } else {
            Navigator.pushNamed(context, Routes.completeProfileScreen);
          }
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: "التحقق من الهاتف",
          onpress: () {
            Navigator.pop(context);
          },
        ),
        body: BodyEnterCodeScreen(),
      ),
    );
  }
}
