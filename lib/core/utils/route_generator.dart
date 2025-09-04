import 'package:flutter/material.dart';
import 'package:laza_ecom/core/constants/app_constants.dart';

// Welcome and splash screens
import 'package:laza_ecom/features/onboarding/welcome_screen.dart';
import 'package:laza_ecom/features/splash/splash_screen.dart';

// Auth screens
import 'package:laza_ecom/features/auth/screens/login_screen.dart';
import 'package:laza_ecom/features/auth/screens/signup_screen.dart';
import 'package:laza_ecom/features/auth/screens/vendor_signup_screen.dart';
import 'package:laza_ecom/features/auth/screens/email_verification_screen.dart';
import 'package:laza_ecom/features/auth/screens/forgot_screen.dart';
import 'package:laza_ecom/features/auth/screens/change_password_screen.dart';

// Customer screens
import 'package:laza_ecom/features/home/home_page.dart';
import 'package:laza_ecom/features/orders/screens/orders_screen.dart';
import 'package:laza_ecom/features/wishlist/screens/wishlist_screen.dart';
import 'package:laza_ecom/features/more/screens/more_screen.dart';
import 'package:laza_ecom/features/category/screens/categories_page.dart';

// Vendor screens
import 'package:laza_ecom/features/vendor/screens/vendor_inventory_screen.dart';
import 'package:laza_ecom/features/vendor/vendor_home.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      // Welcome & Splash Routes
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());

      // Authentication Routes
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRoutes.signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case AppRoutes.vendorSignup:
        return MaterialPageRoute(builder: (_) => const VendorSignupScreen());
      case AppRoutes.forgotPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen(),
        );
      case AppRoutes.changePassword:
        if (args is Map && args['email'] != null) {
          return MaterialPageRoute(
            builder: (context) => ChangePasswordScreen(email: args['email']),
          );
        }
        return _errorRoute();
      case AppRoutes.otpVerification:
        if (args is Map<String, dynamic>) {
          return MaterialPageRoute(
            builder: (_) => EmailVerificationScreen(
              email: args['email'] as String,
              onVerificationComplete:
                  args['onVerificationComplete'] as Function(String),
            ),
          );
        }
        return _errorRoute();
      
      // Customer Routes
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case AppRoutes.orders:
        return MaterialPageRoute(builder: (_) => const OrdersScreen());
      case AppRoutes.wishlist:
        return MaterialPageRoute(builder: (_) => const WishlistScreen());
      case AppRoutes.more:
        return MaterialPageRoute(builder: (_) => const MoreScreen());
      case AppRoutes.categories:
        return MaterialPageRoute(builder: (_) => const CategoriesPage());

      // Vendor Routes
      case AppRoutes.vendorHome:
        return MaterialPageRoute(builder: (_) => const VendorHome());
      case AppRoutes.vendorInventory:
        return MaterialPageRoute(builder: (_) => const VendorInventoryScreen());
      // Add other routes as needed
      default:
        // If there is no such named route in the switch statement
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text('Error')),
          body: const Center(child: Text('Page not found!')),
        );
      },
    );
  }
}
