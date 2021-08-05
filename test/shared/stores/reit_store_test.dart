import 'package:fii_app/shared/interfaces/navigator_service_interface.dart';
import 'package:fii_app/shared/repositories/reit_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorService extends Mock implements NavigatorService {
  @override
  NavigatorState? get currentState => NavigatorState();
}

class MockReitRepository extends Mock implements ReitRepository {}

void main() {
  setUpAll(() {
    GetIt.I.registerLazySingleton<NavigatorService>(
      () => MockNavigatorService(),
    );

    GetIt.I.registerLazySingleton<ReitRepository>(
      () => MockReitRepository(),
    );
  });

  test("Test", () {});
}
