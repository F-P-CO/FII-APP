import 'package:fii_app/core/errors/presentation_exceptions.dart';
import 'package:fii_app/modules/comparator/presentation/pages/comparator_page.dart';
import 'package:fii_app/modules/home/presentation/models/app_page.dart';
import 'package:fii_app/modules/reit_list/presentation/pages/reit_list_page.dart';
import 'package:mobx/mobx.dart';
part 'navigation_store.g.dart';

class NavigationStore = _NavigationStoreBase with _$NavigationStore;

abstract class _NavigationStoreBase with Store {
  @observable
  List<AppPage> pages = [
    AppPage(page: () => ReitListPage()),
    AppPage(page: () => ComparatorPage()),
  ];

  @observable
  int currentPageIndex = 0;

  _NavigationStoreBase() {
    pages[currentPageIndex].isLoaded = true;
  }

  @action
  int changePage(int index) {
    if (index < pages.length) {
      pages[index].isLoaded = true;
      return currentPageIndex = index;
    }

    throw InvalidPageException(
        'No page with index $index was found on pages list');
  }
}
