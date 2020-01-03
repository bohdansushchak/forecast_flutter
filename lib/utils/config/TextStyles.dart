import 'package:flutter/material.dart';

import 'package:forecast_flutter/utils/config/AppColors.dart';

abstract class TextStyles {
  static TextStyle logo = TextStyle(fontSize: 28.0, fontWeight: FontWeight.normal, color: AppColors.black);
  static TextStyle tempMain = TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold, color: AppColors.white);
}