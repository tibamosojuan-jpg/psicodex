import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData light() {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.red,
        primary: AppColors.red,
      ),
      scaffoldBackgroundColor: AppColors.bg,
    );
    return base.copyWith(textTheme: GoogleFonts.nunitoTextTheme(base.textTheme));
  }
}

// fuentes: fredoka para titulos, nunito para textos y press start para lo retro
class AppText {
  static TextStyle display(double size, {Color color = AppColors.text}) =>
      GoogleFonts.fredoka(
          fontSize: size, fontWeight: FontWeight.w600, color: color, height: 1.15);

  static TextStyle body(double size,
          {Color color = AppColors.text, FontWeight weight = FontWeight.w500}) =>
      GoogleFonts.nunito(fontSize: size, color: color, fontWeight: weight, height: 1.4);

  static TextStyle retro(double size, {Color color = AppColors.textSecondary}) =>
      GoogleFonts.pressStart2p(fontSize: size, color: color);
}
