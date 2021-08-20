import 'package:fii_app/core/presentation/themes/app_colors.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(32.0),
            child: Image(
              image: AssetImage('assets/images/icons/splash_icon.png'),
            ),
          ),
        ),
      ),
    );
  }
}
