import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karmalab_assignment/constants/color_constants.dart';

class CustomTextTheme {
  static TextStyle titleSmall() {
    return GoogleFonts.openSans(
      fontSize: 16,
      color: AppColors.texty,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle title() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w700,
      fontSize: 32,
      color: AppColors.dark,
    );
  }

  static TextStyle displayMedium() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: AppColors.texty,
    );
  }

  static TextStyle displayLarge() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w400,
      fontSize: 20,
      color: AppColors.texty,
    );
  }
}
