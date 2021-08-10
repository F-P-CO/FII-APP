import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: avoid_classes_with_only_static_members
abstract class AppTextStyles {
  static final title = GoogleFonts.montserrat(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
  );

  static final subtitle = GoogleFonts.montserrat(
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
  );

  static final captionHeader = GoogleFonts.montserrat(
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
  );

  static final captionBody = GoogleFonts.montserrat(
    fontSize: 18.0,
    fontWeight: FontWeight.w400,
  );
}
