import 'package:flutter/material.dart';
import 'package:getx_mvvm/resources/Getx_localization/languages.dart';
import 'package:getx_mvvm/resources/routes/routes.dart';
import 'package:getx_mvvm/view/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      translations: Languages(),
      locale: const Locale('ur', 'PK'),
      fallbackLocale: const Locale('en', 'US'),
      home: const SplashScreen(),
      getPages: [
        AppRoutes.approutes()
      ],
    );
  }
}