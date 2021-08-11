import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: avoid_classes_with_only_static_members
abstract class AppTextStyles {
  static final primaryFont = GoogleFonts.montserrat();
  static final secondaryFont = GoogleFonts.lexendDeca();

  static final title = primaryFont.copyWith(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
  );

  static final subtitle = primaryFont.copyWith(
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
  );

  static final captionHeader = primaryFont.copyWith(
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
  );

  static final captionBody = primaryFont.copyWith(
    fontSize: 18.0,
    fontWeight: FontWeight.w400,
  );
}
