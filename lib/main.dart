import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:untitled2/Translations/locale_strings.dart';
// import 'package:untitled2/auth/login.dart';
import 'package:untitled2/home.dart';
// import 'package:untitled2/profile/profile.dart';
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
      translations: MyTranslations(), // اسم الكلاس الذي أنشأته في locale_strings.dart
    locale: Locale('ar', 'SA'),    // اللغة الحالية
    fallbackLocale: Locale('en', 'US'),
      home: Home(namein: '' ),
    );
  }
}