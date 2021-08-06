import 'package:fii_app/shared/interfaces/navigator_service_interface.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

NavigatorState useNavigatorService() {
  final currentState = GetIt.I.get<NavigatorService>().currentState;

  if (currentState == null) {
    throw Exception("Error in accessing currentState on NavigatorService.");
  }

  return currentState;
}
