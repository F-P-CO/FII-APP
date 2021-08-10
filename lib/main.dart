import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'core/di/injections.dart' as di;
import 'core/navigation/navigator_service.dart';
import 'core/navigation/routes.dart' as routes;

void main() {
  di.init();
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
      routes: routes.list,
    );
  }
}
