import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/features/auth/cubit/auth_cubit/auth_cubit.dart';
import 'package:herafy/features/auth/cubit/auth_cubit/auth_state.dart';
import 'package:herafy/features/auth/ui/widgets/user_type_selection_body.dart';

class UserTypeSelectionScreen extends StatelessWidget {
  const UserTypeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthEnterPhone) {
          Navigator.pushNamed(context, Routes.loginNumberScreen);
        }
      },
      child: Scaffold(
        body: SafeArea(child: UserTypeSelectionBody()),
      ),
    );
  }
}
