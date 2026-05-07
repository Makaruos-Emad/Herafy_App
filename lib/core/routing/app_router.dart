import 'package:flutter/material.dart';
import 'package:herafy/features/auth/ui/allow_location_screen.dart';
import 'package:herafy/features/auth/ui/complete_profile_screen.dart';
import 'package:herafy/features/auth/ui/login_number_screen.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/features/auth/ui/enter_code_screen.dart';
import 'package:herafy/features/auth/ui/user_type_selection_screen.dart';
import 'package:herafy/features/home/ui/all_services_screen.dart';
import 'package:herafy/features/home/ui/home_client_screen.dart';
import 'package:herafy/features/home/ui/home_technician_screen.dart';
import 'package:herafy/features/home/ui/search_screen.dart';
import 'package:herafy/features/login_technical/ui/check_tech_id_success_screen.dart';
import 'package:herafy/features/login_technical/ui/complete_profile_technical_screen.dart';
import 'package:herafy/features/login_technical/ui/upload_id_tech_screen.dart';
import 'package:herafy/features/notification/ui/notifications_screen.dart';
import 'package:herafy/features/onboarding/ui/onboarding_screen.dart';
import 'package:herafy/features/requests/ui/report_problem_screen.dart';
import 'package:herafy/features/requests/ui/request_tracker_screen.dart';
import 'package:herafy/features/requests/ui/view_invoice_screen.dart';
import 'package:herafy/features/profile/ui/edit_profile_screen.dart';
import 'package:herafy/features/service_request/models/check_request_args.dart';
import 'package:herafy/features/service_request/ui/book_appointment_screen.dart';
import 'package:herafy/features/service_request/ui/check_request_screen.dart';
import 'package:herafy/features/service_request/ui/select_technician_screen.dart';
import 'package:herafy/features/service_request/ui/success_request_screen.dart';
import 'package:herafy/features/service_request/ui/tech_selected_profile_screen.dart';
import 'package:herafy/features/technical_task/ui/closed_task_back_home_screen.dart';
import 'package:herafy/features/technical_task/ui/finish_task_from_tech_screen.dart';
import 'package:herafy/features/technical_task/ui/task_details_screnn.dart';
import 'package:herafy/generated/l10n.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case Routes.loginNumberScreen:
        return MaterialPageRoute(builder: (_) => LoginNumberScreen());

      case Routes.enterCodeScreen:
        return MaterialPageRoute(builder: (_) => EnterCodeScreen());
      case Routes.userTypeSelectionScreen:
        return MaterialPageRoute(builder: (_) => UserTypeSelectionScreen());

      case Routes.completeProfileScreen:
        return MaterialPageRoute(builder: (_) => CompleteClientProfileScreen());

      case Routes.allowLocationScreen:
        return MaterialPageRoute(builder: (_) => AllowLocationScreen());

      case Routes.homeClientScreen:
        return MaterialPageRoute(builder: (_) => HomeClientScreen());

      case Routes.selectTechnicianScreen:
        final args = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => SelectTechnicianScreen(serviceId: args),
        );
      case Routes.technicialSelectedProfileScreen:
        final args = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => TechSelectedProfileScreen(id: args),
        );
      case Routes.bookAppointmentScreen:
        return MaterialPageRoute(builder: (context) => BookAppointmentScreen());
      case Routes.checkRequestScreen:
        final args = settings.arguments;
        if (args is! CheckRequestArgs) {
          return _errorRoute(
            'Missing/invalid arguments for ${Routes.checkRequestScreen}. '
            'Expected CheckRequestArgs.',
          );
        }
        return MaterialPageRoute(
          builder: (context) => CheckRequestScreen(
            time: args.time,
            date: args.date,
            address: args.address,
            governorate: args.governorate,
            center: args.center,
          ),
        );

      case Routes.successRequestScreen:
        return MaterialPageRoute(
          builder: (context) => const SuccessRequestScreen(),
        );
      case Routes.editProfileScreen:
        return MaterialPageRoute(builder: (_) => EditProfileScreen());
      case Routes.notificationsScreen:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());

      case Routes.allServicesScreen:
        return MaterialPageRoute(builder: (_) => const AllServicesScreen());

      case Routes.searchScreen:
        return MaterialPageRoute(builder: (_) => const SearchScreen());

      case Routes.invoiceDetailsScreen:
        return MaterialPageRoute(builder: (_) => const InvoiceDetailsScreen());

      case Routes.reportProblemScreen:
        return MaterialPageRoute(builder: (_) => const ReportProblemScreen());

      case Routes.requestTrackerScreen:
        return MaterialPageRoute(builder: (_) => const RequestTrackerScreen());

      case Routes.completeTechnicialProfileScreen:
        return MaterialPageRoute(
          builder: (_) => const CompleteProfileTechnicalScreen(),
        );
      case Routes.uploadIdTechnicialScreen:
        return MaterialPageRoute(builder: (_) => UploadIdTechScreen());
      case Routes.checkTechIdSuccessScreen:
        return MaterialPageRoute(
          builder: (_) => const CheckTechIdSuccessScreen(),
        );
      case Routes.taskDetailsScreen:
        return MaterialPageRoute(builder: (_) => const TaskDetailsScreen());
      case Routes.finishTaskScreen:
        return MaterialPageRoute(builder: (_) => FinishTaskFromTechScreen());
      case Routes.closedTaskBackHomeScreen:
        return MaterialPageRoute(
          builder: (_) => const ClosedTaskBackHomeScreen(),
        );

      case Routes.homeTechnicianScreen:
        return MaterialPageRoute(builder: (_) => const HomeTechnicianScreen());

      default:
        return null;
    }
  }

  Route _errorRoute(String message) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Routing Error')),
        body: Center(child: Text(message, textAlign: TextAlign.center)),
      ),
    );
  }
}
