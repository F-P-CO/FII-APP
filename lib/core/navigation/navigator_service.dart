import 'package:flutter/material.dart';

class NavigatorService {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState? get currentState => navigatorKey.currentState;
}
