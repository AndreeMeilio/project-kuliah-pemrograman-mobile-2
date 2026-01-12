
import 'package:core/constant/text_styles_enum.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension AppTextStyleExtention on AppTextStyle{
  TextStyle get(){
    switch (this) {
      case AppTextStyle.kHeading1:
        return GoogleFonts.lato(
          fontSize: 32,
          height: 1.25,
          fontWeight: FontWeight.w700,
        );

      case AppTextStyle.kHeading2:
        return GoogleFonts.lato(
          fontSize: 24,
          height: 1.3,
          fontWeight: FontWeight.w600,
        );

      case AppTextStyle.kHeading3:
        return GoogleFonts.lato(
          fontSize: 20,
          height: 1.3,
          fontWeight: FontWeight.w600,
        );

      case AppTextStyle.kSubtitle1:
        return GoogleFonts.lato(
          fontSize: 16,
          height: 1.4,
          fontWeight: FontWeight.w500,
        );

      case AppTextStyle.kSubtitle2:
        return GoogleFonts.lato(
          fontSize: 14,
          height: 1.4,
          fontWeight: FontWeight.w500,
        );

      case AppTextStyle.kBody1:
        return GoogleFonts.lato(
          fontSize: 16,
          height: 1.5,
          fontWeight: FontWeight.w400,
        );

      case AppTextStyle.kBody2:
        return GoogleFonts.lato(
          fontSize: 14,
          height: 1.5,
          fontWeight: FontWeight.w400,
        );

      case AppTextStyle.kSmall:
        return GoogleFonts.lato(
          fontSize: 12,
          height: 1.4,
          fontWeight: FontWeight.w400,
        );

      case AppTextStyle.kExtraSmall:
        return GoogleFonts.lato(
          fontSize: 10,
          height: 1.3,
          fontWeight: FontWeight.w400,
        );
    }
  }
}