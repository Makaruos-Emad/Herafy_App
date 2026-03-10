import 'package:flutter/material.dart';
import 'package:herafy/core/routing/app_router.dart';
import 'package:herafy/core/services/shared_preferences_singleton.dart';
import 'package:herafy/herafy_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp(HerafyApp(appRouter: AppRouter()));
}
