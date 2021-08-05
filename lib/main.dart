import 'package:dio/dio.dart';
import 'package:fii_app/shared/interfaces/navigator_service_interface.dart';
import 'package:fii_app/shared/repositories/reit_repository.dart';
import 'package:fii_app/shared/services/app_navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'modules/home/stores/reit_list_store.dart';
import 'routes.dart';

void main() {
  GetIt.I.registerLazySingleton(() => ReitListStore());
  GetIt.I.registerLazySingleton(() => Dio());
  GetIt.I.registerLazySingleton(() => ReitRepository());

  GetIt.I.registerLazySingleton<NavigatorService>(
    () => AppNavigatorService(),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FII',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: GetIt.I.get<NavigatorService>().navigatorKey,
      initialRoute: '/home',
      routes: appRoutes,
    );
  }
}
