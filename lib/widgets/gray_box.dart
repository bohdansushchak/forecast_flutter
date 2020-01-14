import 'package:flutter/material.dart';
import 'package:forecast_flutter/config/app_colors.dart';

class GrayBox extends StatelessWidget {
  final Widget child;
  final EdgeInsets margin;
  final EdgeInsets padding;

  GrayBox({
    @required this.child,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      margin: margin,
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.blueDarker.withOpacity(0.4),
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
      ),
      padding: padding,
      child: child,
    ),);
  }
}
