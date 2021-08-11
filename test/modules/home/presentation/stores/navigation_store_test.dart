import 'package:fii_app/core/errors/presentation_exceptions.dart';
import 'package:fii_app/modules/home/presentation/stores/navigation_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late NavigationStore navigationStore;

  setUp(() {
    navigationStore = NavigationStore();
  });

  group('constructor', () {
    test('should set [isLoaded] from current page to true', () {
      final currentPage = navigationStore.currentPageIndex;
      expect(navigationStore.pages[currentPage].isLoaded, true);
    });
  });

  group('changePage', () {
    test('should set [currentPageIndex] to the new page index', () {
      const newPage = 1;
      navigationStore.changePage(newPage);

      expect(navigationStore.currentPageIndex, newPage);
    });

    test('should set [isLoaded] from the new page to true', () {
      const newPage = 1;
      navigationStore.changePage(newPage);

      expect(navigationStore.pages[newPage].isLoaded, true);
    });

    test(
        'should not change [isLoaded] from pages that have not been changed to',
        () {
      const newPage = 0;
      navigationStore.changePage(newPage);

      expect(navigationStore.pages[1].isLoaded, false);
    });

    test(
        'should throw [InvalidPageException] when page with provided index does not exist',
        () {
      const newPage = 10;

      expect(() => navigationStore.changePage(newPage),
          throwsA(isA<InvalidPageException>()));
    });
  });
}
