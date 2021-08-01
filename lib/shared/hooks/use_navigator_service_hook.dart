import 'package:fii_app/shared/services/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

NavigatorState? useNavigatorService() {
  final currentState = GetIt.I.get<NavigatorService>().currentState;

  if (currentState == null) {
    throw Exception("Error in accessing currentState on NavigatorService.");
  }

  return currentState;
}
