import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:forecast_flutter/app/AppRoutes.dart';
import 'package:forecast_flutter/utils/config/AppColors.dart';
import 'package:forecast_flutter/utils/config/TextStyles.dart';

class SplashScreen extends StatefulWidget {
  @override
  State createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.of(context).pushReplacementNamed(AppRoutes.APP_ROUTE_HOME);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Container(
            child:
                Center(child: Text("Forecast flutter", style: TextStyles.logo)),
          ),
        ));
  }
}
