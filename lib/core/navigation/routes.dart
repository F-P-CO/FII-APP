import 'package:fii_app/modules/comparator_settings/presentation/comparator_settings_page.dart';
import 'package:fii_app/modules/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> list = {
  '/': (_) => HomePage(),
  '/comparator-settings': (_) => ComparatorSettingsPage(),
};
