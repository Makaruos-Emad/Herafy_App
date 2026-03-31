import 'package:flutter/material.dart';
import 'package:herafy/features/auth/ui/allow_location_screen.dart';
import 'package:herafy/features/auth/ui/complete_profile_screen.dart';
import 'package:herafy/features/auth/ui/login_number_screen.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/features/auth/ui/enter_code_screen.dart';
import 'package:herafy/features/auth/ui/user_type_selection_screen.dart';
import 'package:herafy/features/home/ui/all_services_screen.dart';
import 'package:herafy/features/home/ui/home_client_screen.dart';
import 'package:herafy/features/notification/ui/notifications_screen.dart';
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
        return MaterialPageRoute(builder: (_) => UserTypeSelectionScreen());

      case Routes.completeProfileScreen:
        return MaterialPageRoute(builder: (_) => CompleteProfileScreen());

      case Routes.allowLocationScreen:
        return MaterialPageRoute(builder: (_) => AllowLocationScreen());

      case Routes.homeClientScreen:
        return MaterialPageRoute(builder: (_) => HomeClientScreen());

      case Routes.notificationsScreen:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());

      case Routes.allServicesScreen:
        return MaterialPageRoute(builder: (_) => const AllServicesScreen());

      default:
        return null;
    }
  }
}
