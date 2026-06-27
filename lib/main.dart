import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/core/routing/app_router.dart';
import 'package:herafy/core/services/shared_preferences_singleton.dart';
import 'package:herafy/features/auth/cubit/auth_cubit/auth_cubit.dart';
import 'package:herafy/features/profile/cubit/profile_cubit.dart';
import 'package:herafy/features/profile/cubit/profile_tech_cubit.dart';
import 'package:herafy/herafy_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => ProfileCubit()..getProfile()),
        BlocProvider(create: (context) => ProfileTechCubit()..getProfile()),
      ],
      child: HerafyApp(appRouter: AppRouter()),
    ),
  );
}
