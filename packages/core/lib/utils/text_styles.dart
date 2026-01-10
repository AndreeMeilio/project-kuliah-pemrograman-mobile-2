

import 'package:core/constant/colors.dart';
import 'package:core/constant/font_weight.dart';
import 'package:core/constant/text_styles_enum.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension AppTextStyleExtention on AppTextStyle{
  TextStyle get(){
    switch(this){
      case AppTextStyle.kHeading1:
        return GoogleFonts.lato(
          fontSize: 24,
          color: AppColors.black100,
          fontWeight: AppFontWeight.bold,
          letterSpacing: 0.15,
        );
      case AppTextStyle.kHeading2:
        return GoogleFonts.lato(
          fontSize: 20.0,
          color: AppColors.black100,
          fontWeight: AppFontWeight.bold,
          letterSpacing: 0.15,
        );
      case AppTextStyle.kHeading3:
        return GoogleFonts.lato(
          fontSize: 18.0,
          color: AppColors.black100,
          fontWeight: AppFontWeight.bold,
          letterSpacing: 0.15,
        );
      case AppTextStyle.kSubtitle1:
        return GoogleFonts.lato(
          fontSize: 16,
          color: AppColors.black100,
          fontWeight: AppFontWeight.semiBold,
          letterSpacing: 0.15,
        );
      case AppTextStyle.kSubtitle2:
        return GoogleFonts.lato(
          fontSize: 14,
          color: AppColors.black100,
          fontWeight: AppFontWeight.semiBold,
          letterSpacing: 0.15,
        );
      case AppTextStyle.kBody1:
        return GoogleFonts.lato(
          fontSize: 16.0,
          color: AppColors.black100,
          fontWeight: AppFontWeight.normal,
          letterSpacing: 0.15,
        );
      case AppTextStyle.kBody2:
        return GoogleFonts.lato(
          fontSize: 14.0,
          color: AppColors.black100,
          fontWeight: AppFontWeight.normal,
          letterSpacing: 0.15,
        );
      case AppTextStyle.kSmall:
        return GoogleFonts.lato(
          fontSize: 12.0,
          fontWeight: AppFontWeight.normal,
          letterSpacing: 0.15,
        );
      case AppTextStyle.kExtraSmall:
        return GoogleFonts.lato(
          fontSize: 10.0,
          fontWeight: AppFontWeight.normal,
          letterSpacing: 0.15,
        );
      default:
        return GoogleFonts.lato(
          fontSize: 16.0,
          color: AppColors.black100,
          fontWeight: AppFontWeight.normal,
          letterSpacing: 0.15,
        );
    }
  }
}