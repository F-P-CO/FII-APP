import 'package:flutter/material.dart';

abstract class NavigatorService {
  late GlobalKey<NavigatorState> navigatorKey;
  NavigatorState? get currentState;
}
