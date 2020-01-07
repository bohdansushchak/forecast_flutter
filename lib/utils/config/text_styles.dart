import 'package:flutter/material.dart';

import 'package:forecast_flutter/utils/config/app_colors.dart';

abstract class TextStyles {
  static TextStyle whiteBig = TextStyle(fontSize: 28.0, fontWeight: FontWeight.normal, color: AppColors.white);

  static TextStyle tempMain = TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold, color: AppColors.white);

  static TextStyle whiteMiddle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.white);
}