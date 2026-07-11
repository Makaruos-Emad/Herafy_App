import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/core/widgets/custom_app_bar.dart';
import 'package:herafy/features/auth/cubit/auth_cubit/auth_cubit.dart';
import 'package:herafy/features/auth/cubit/auth_cubit/auth_state.dart';
import 'package:herafy/features/auth/helper/save_user_type_in_storge.dart';
import 'package:herafy/features/auth/ui/widgets/login_screen_body.dart';

class LoginNumberScreen extends StatelessWidget {
  const LoginNumberScreen({super.key});

  Future<int> _getSelectedUserTypeId(AuthCubit cubit) async {
    if (cubit.userType == UserType.technician) {
      return 0;
    } else if (cubit.userType == UserType.client) {
      return 1;
    }

    return await getUserType() ?? 1;
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is AuthEnterData) {
          final userTypeId = await _getSelectedUserTypeId(cubit);
          if (!context.mounted) return;

          if (userTypeId == 0) {
            Navigator.pushNamed(
              context,
              Routes.completeTechnicialProfileScreen,
            );
          } else {
            Navigator.pushNamed(context, Routes.completeProfileScreen);
          }
        } else if (state is AuthToHomePage) {
          final userTypeId = await _getSelectedUserTypeId(cubit);
          if (!context.mounted) return;

          if (userTypeId == 0) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.homeTechnicianScreen,
              (route) => false,
            );
          } else {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.homeClientScreen,
              (route) => false,
            );
          }
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBar(
          title: 'أهلاً بيك   👋',
          onpress: () {
            Navigator.pop(context);
          },
        ),
        body: const LoginScreenBody(),
      ),
    );
  }
}
