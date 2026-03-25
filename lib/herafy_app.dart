import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:herafy/core/routing/app_router.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/core/services/shared_preferences_singleton.dart';
import 'package:herafy/core/utils/app_constants.dart';

class HerafyApp extends StatelessWidget {
  const HerafyApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      // Set the text direction to right-to-left for Arabic language
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        title: 'Herafy',
        debugShowCheckedModeBanner: false,
        //Changed the locale to Arabic
        locale: const Locale('ar'),
        supportedLocales: const [Locale('ar')],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: "Almarai",
          // primaryColor: AppColors.primaryColor,
          appBarTheme: AppBarTheme(backgroundColor: Colors.white, elevation: 0),
        ),
        initialRoute: Routes.selectTechnicianScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}

String navigateToInitialRoute() {
  bool isOnboardingSeen = Prefs.getBool(kIsOnboardingSeen);

  if (isOnboardingSeen) {
    return Routes.loginNumberScreen;
  } else {
    return Routes.onboardingScreen;
  }
}
