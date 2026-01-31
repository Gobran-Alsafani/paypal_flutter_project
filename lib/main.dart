import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:paypal_application/Translations/locale_strings.dart';
import 'spashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations:
          MyTranslations(),
      locale: Locale('ar', 'SA'),
      fallbackLocale: Locale('en', 'US'),
      home: SpashScreen(),
    );
  }
}
