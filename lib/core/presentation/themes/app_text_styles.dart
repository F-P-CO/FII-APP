import 'package:fii_app/core/presentation/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: avoid_classes_with_only_static_members
abstract class AppTextStyles {
  static final primaryFont = GoogleFonts.montserrat();
  static final secondaryFont = GoogleFonts.lexendDeca();

  static final primaryFontWeightThin = FontWeight.w100;
  static final primaryFontWeightExtraLight = FontWeight.w200;
  static final primaryFontWeightLight = FontWeight.w300;
  static final primaryFontWeightRegular = FontWeight.w400;
  static final primaryFontWeightMedium = FontWeight.w500;
  static final primaryFontWeightSemibold = FontWeight.w600;
  static final primaryFontWeightBold = FontWeight.w700;
  static final primaryFontWeightExtraBold = FontWeight.w800;
  static final primaryFontWeightBlack = FontWeight.w900;

  static final secondaryFontWeightRegular = FontWeight.w400;

  static final largeHeader = primaryFont.copyWith(
    fontSize: 20,
    fontWeight: primaryFontWeightSemibold,
    color: AppColors.black,
  );

  static final largeBoldHeader = primaryFont.copyWith(
    fontSize: 20,
    fontWeight: primaryFontWeightBold,
    color: AppColors.black,
  );

  static final header = primaryFont.copyWith(
    fontSize: 18.0,
    fontWeight: primaryFontWeightSemibold,
    color: AppColors.blackGrey,
  );

  static final smallHeader = primaryFont.copyWith(
    fontSize: 14.0,
    fontWeight: primaryFontWeightMedium,
  );

  static final button = primaryFont.copyWith(
    fontSize: 16.0,
    fontWeight: primaryFontWeightSemibold,
    color: AppColors.blackGrey,
  );
}
