import 'package:event_bus/event_bus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pocketbook/core/theme/app_theme.dart';
import 'package:pocketbook/init_page.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/services/app_services/api_services.dart';
import 'package:pocketbook/services/app_services/app_services.dart';
import 'package:pocketbook/services/app_services/repo_services.dart';
import 'package:pocketbook/services/firebase/firebase_service.dart';
import 'package:pocketbook/utils/app_config.dart';
import 'package:pocketbook/utils/app_constant.dart';
import 'package:pocketbook/utils/app_enum.dart';
import 'package:pocketbook/utils/app_routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

EventBus eventBus = EventBus();

Future<void> runMyApp({
  String? flavorEnv,
  AppFlavor debugType = AppFlavor.staging,
}) async {
  var environment = flavorEnv ?? const String.fromEnvironment('ENV');
  var apiHostUrl = 'http://localhost:3000';

  await FirebaseService.initFirebaseService();

  /// PRODUCTION
  if (environment == 'production') {
    apiHostUrl = 'https://api.mymedica.jp';

    /// DEV
  } else if (environment == 'dev') {
    apiHostUrl = 'https://api.stg.mymedica.jp';
  }

  Get.put<AppEnvironment>(
    AppEnvironment.live(
      apiBaseUrl: apiHostUrl,
    ),
  );

  try {
    await AppServices.initServices();
    await ApiServices.initServices();
    await RepoServices.initServices();
  } catch (_) {}

// Set landscape orientation
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  final user = FirebaseAuth.instance.currentUser;

  runApp(
    GetMaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale(LocaleKey.en, CountryKey.us),
      ],
      locale: const Locale(LocaleKey.en, CountryKey.us),
      defaultTransition: Transition.cupertino,
      debugShowCheckedModeBanner: false,
      initialRoute: user != null ? RoutesName.main : RoutesName.login,
      getPages: AppRoutes.mainRoutes,
      theme: AppThemes.lightTheme,
      translations: Language(),
      builder: (context, child) => InitPage(
        child: child ?? const SizedBox(),
      ),
    ),
  );
}
