import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // app basic colors
  static const Color primary = Color.fromARGB(255, 10, 181, 200);
  static const Color secondary = Color.fromARGB(255, 255, 214, 7);
  static const Color accent = Color(0xFFb0c7ff);

  //gradint color 
  static const Gradient linerGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0xffff9a9e),
      Color(0xfffad0c4),
      Color(0xfffad0c4),
    ],
  );

  // app text colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C7570);
  static const Color textWhite = AppColors.white;
  static const Color textBlack = AppColors.black;

  // app background colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  // app border colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // app container colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  //static const Color darkContainer = TColors.white.withOpacity(0.1);

  // app button colors
  static const Color buttonPrimary = Color(0xFF4b68ff);
  static const Color buttonSecondary = Color(0xFF6C7570);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  // app error and validation colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warining = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // neutral shades
  static const Color black = Color(0xFF000000);
  static const Color darkerGray = Color(0xFF4F4F4F);
  static const Color darkGray = Color(0xFF939393);
  static const Color gray = Color(0xFFE0E0E0);
  static const Color softGray = Color(0xFFF4F4F4);
  static const Color lightGray = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);

  //font family 
  static const String kFontFamily = "Montserrat";
  
}
