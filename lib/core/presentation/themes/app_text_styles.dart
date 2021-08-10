import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: avoid_classes_with_only_static_members
abstract class AppTextStyles {
  static final title = GoogleFonts.ibmPlexSans(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
  );

  static final subtitle = GoogleFonts.ibmPlexSans(
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
  );

  static final captionHeader = GoogleFonts.ibmPlexSans(
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
  );

  static final captionBody = GoogleFonts.ibmPlexSans(
    fontSize: 18.0,
  );
}
