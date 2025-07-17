import 'dart:async';
import 'package:flutter/material.dart';
import 'package:laza_ecom/core/constants/app_constants.dart';
import 'package:laza_ecom/core/theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the next screen after a delay
    Timer(const Duration(seconds: 2), () {
      // Check if onboarding was completed before
      // For now, always navigate to welcome screen
      Navigator.pushReplacementNamed(context, AppRoutes.welcome);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo text with the red color from the design
            Text(
              'laza',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 48,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
