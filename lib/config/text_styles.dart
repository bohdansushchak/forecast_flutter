import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract class TextStyles {
  static TextStyle _defaultFont = GoogleFonts.baloo();

  static TextStyle appBarTitle = _defaultFont.copyWith(
    fontSize: 28.0,
    fontWeight: FontWeight.normal,
    color: AppColors.white,
  );

  static TextStyle whiteBig = _defaultFont.copyWith(
    fontSize: 28.0,
    fontWeight: FontWeight.normal,
    color: AppColors.white,
  );

  static TextStyle tempMain = _defaultFont.copyWith(
    fontSize: 36.0,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static TextStyle whiteMiddle = _defaultFont.copyWith(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );
}
