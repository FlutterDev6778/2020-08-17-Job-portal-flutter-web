import 'package:flutter/material.dart';
import 'package:job_portal/src/pages/App/app.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  runApp(
    EasyLocalization(
      child: App(),
      path: 'assets/langs',
      useOnlyLangCode: true,
      supportedLocales: [
        Locale('ar', 'DZ'),
        Locale('en', 'US'),
      ],
      saveLocale: true,
      startLocale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
    ),
  );
}
