import 'package:flutter/material.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/features/auth/ui/login_number_screen.dart';
import 'package:herafy/features/home/ui/home_client_screen.dart';
import 'package:herafy/features/onboarding/ui/onboarding_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case Routes.loginNumberScreen:
        return MaterialPageRoute(builder: (_) => const LoginNumberScreen());

      case Routes.homeClientScreen:
        return MaterialPageRoute(builder: (_) => const HomeClientScreen());
      default:
        return null;
    }
  }
}
