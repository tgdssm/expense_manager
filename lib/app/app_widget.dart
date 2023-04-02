import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../design_system/design_system_export.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ["assets/lang"];
    return MaterialApp.router(
      title: "Expense Manager",
      theme: ThemeData(
        fontFamily: "Nunito Sans",
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.white,
        unselectedWidgetColor: AppColors.grey2,
        disabledColor: AppColors.grey2,
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        LocalJsonLocalization.delegate,
      ],
      supportedLocales: const [
        Locale("en", "US"),
        Locale("pt", "BR"),
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        if (supportedLocales.contains(locale)) {
          return locale;
        }

        switch (locale?.languageCode) {
          case "pt":
            return const Locale("pt", "BR");
          case "en":
            return const Locale("en", "US");
          default:
            return const Locale("en", "US");
        }
      },
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
