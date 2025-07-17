import 'package:flutter/material.dart';
import 'package:laza_ecom/core/constants/app_constants.dart';
import 'package:laza_ecom/core/theme/app_theme.dart';
import 'package:laza_ecom/core/utils/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}


