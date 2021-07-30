import 'package:fii_app/shared/interfaces/navigator_service_interface.dart';
import 'package:flutter/material.dart';

class NavigatorService implements INavigatorService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  NavigatorState? get currentState => navigatorKey.currentState;
}
