import 'package:fii_app/shared/stores/reit_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("ReitStore 'text' attribute should be 'Hello World'", () {
    final ReitStore reitStore = ReitStore();
    expect(reitStore.text, equals('Hello World'));
  });
}
