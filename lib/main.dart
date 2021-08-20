import 'package:fii_app/modules/splash_screen/presentation/pages/splash_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'core/di/injections.dart' as di;
import 'core/navigation/navigator_service.dart';
import 'core/navigation/routes.dart' as routes;
import 'core/presentation/themes/app_colors.dart';

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetIt.I.allReady(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return MaterialApp(
            title: 'Meu Fundo Imobiliário',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              primaryColor: AppColors.primary,
            ),
            navigatorKey: GetIt.I.get<NavigatorService>().navigatorKey,
            routes: routes.list,
          );
        } else {
          return const SplashScreenPage();
        }
      },
    );
  }
}
