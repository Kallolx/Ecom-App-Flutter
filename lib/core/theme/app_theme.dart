import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Main Colors
  static const Color primaryColor = Color(0xFFF83758);
  static const Color secondaryColor = Color(0xFF1D1E20);
  static const Color backgroundColor = Colors.white;
  static const Color lightGrayColor = Color(0xFFF5F5F5);
  static const Color darkGrayColor = Color(0xFF8F959E);
  static const Color textColor = Color(0xFF1D1E20);
  static const Color errorColor = Color(0xFFFF4B55);
  static const Color successColor = Color(0xFF4CAF50);

  // Font Sizes
  static const double heading1 = 28.0;
  static const double heading2 = 24.0;
  static const double heading3 = 20.0;
  static const double bodyLarge = 18.0;
  static const double bodyMedium = 16.0;
  static const double bodySmall = 14.0;
  static const double caption = 12.0;

  static ThemeData get lightTheme => ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backgroundColor,
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          displayLarge: GoogleFonts.poppins(
            color: textColor,
            fontSize: heading1,
            fontWeight: FontWeight.w700,
          ),
          displayMedium: GoogleFonts.poppins(
            color: textColor,
            fontSize: heading2,
            fontWeight: FontWeight.w700,
          ),
          displaySmall: GoogleFonts.poppins(
            color: textColor,
            fontSize: heading3,
            fontWeight: FontWeight.w600,
          ),
          bodyLarge: GoogleFonts.poppins(
            color: textColor,
            fontSize: bodyLarge,
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: GoogleFonts.poppins(
            color: textColor,
            fontSize: bodyMedium,
            fontWeight: FontWeight.w500,
          ),
          bodySmall: GoogleFonts.poppins(
            color: textColor,
            fontSize: bodySmall,
            fontWeight: FontWeight.w400,
          ),
          labelSmall: GoogleFonts.poppins(
            color: darkGrayColor,
            fontSize: caption,
            fontWeight: FontWeight.w400,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          primary: primaryColor,
          secondary: secondaryColor,
          surface: backgroundColor,
          background: backgroundColor,
          error: errorColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: GoogleFonts.poppins(
              fontSize: bodyMedium,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: lightGrayColor,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: primaryColor, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: errorColor, width: 1),
          ),
          hintStyle: GoogleFonts.poppins(
            color: darkGrayColor,
            fontSize: bodyMedium,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
}
