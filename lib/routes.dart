import 'package:flutter/material.dart';

import 'app.dart';
import 'modules/home/home_page.dart';

Map<String, WidgetBuilder> appRoutes = {
  '/': (_) => const App(),
  '/home': (_) => const HomePage(),
};
