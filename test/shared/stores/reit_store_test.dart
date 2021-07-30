import 'package:fii_app/shared/interfaces/navigator_service_interface.dart';
import 'package:fii_app/shared/stores/reit_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

class NavigatorServiceMock implements INavigatorService {
  @override
  NavigatorState? get currentState => NavigatorState();
}

void main() {
  test("ReitStore 'text' attribute should be 'Hello World'", () {
    GetIt.I.registerSingleton<INavigatorService>(NavigatorServiceMock());

    final ReitStore reitStore = ReitStore();
    expect(reitStore.text, equals('Hello World'));
  });
}
