import 'package:flutter/material.dart';
import 'package:herafy/features/auth/ui/complete_profile_screen.dart';
import 'package:herafy/features/auth/ui/login_number_screen.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/features/auth/ui/enter_code_screen.dart';
import 'package:herafy/features/auth/ui/user_type_selection_screen.dart';
import 'package:herafy/features/onboarding/ui/onboarding_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case Routes.loginNumberScreen:
        return MaterialPageRoute(builder: (_) => LoginNumberScreen());

      case Routes.enterCodeScreen:
        final phoneNumber = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => EnterCodeScreen(phoneNumber: phoneNumber),
        );
      case Routes.userTypeSelectionScreen:
        return MaterialPageRoute(
          builder: (_) =>  UserTypeSelectionScreen(),
        );

      case Routes.completeProfileScreen:
        return MaterialPageRoute(builder: (_) =>  CompleteProfileScreen());  

      default:
        return null;
    }
  }
}
