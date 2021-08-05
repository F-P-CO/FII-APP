import 'package:fii_app/shared/models/reit.dart';
import 'package:fii_app/shared/repositories/reit_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'reit_store.g.dart';

class ReitStore = _ReitStoreBase with _$ReitStore;

enum ReitListSortOption { netWorth, currentDividendYield, assetsAmount }

abstract class _ReitStoreBase with Store {
  final repository = GetIt.I.get<ReitRepository>();

  @observable
  bool hasError = false;

  @observable
  List<Reit> reits = [];

  @observable
  bool isListLoading = false;

  @observable
  ReitListSortOption _currentSortOption = ReitListSortOption.netWorth;

  @computed
  List<Reit> get currentReitList {
    final List<Reit> localReits = reits;
    switch (_currentSortOption) {
      case ReitListSortOption.assetsAmount:
        localReits.sort((a, b) => b.assetsAmount.compareTo(a.assetsAmount));
        break;
      case ReitListSortOption.netWorth:
        localReits.sort((a, b) => b.netWorth?.compareTo(a.netWorth ?? 0) ?? 0);
        break;
      default:
        localReits.sort((a, b) =>
            b.currentDividendYield?.compareTo(a.currentDividendYield ?? 0) ??
            0);
    }
    return localReits.sublist(
        0, localReits.length >= 10 ? 9 : localReits.length);
  }

  @action
  Future<void> loadReitsList() async {
    try {
      isListLoading = true;
      reits = await repository.getAll();
    } finally {
      isListLoading = false;
    }
  }

  set currentSortOption(ReitListSortOption newOption) =>
      _currentSortOption = newOption;

  ReitListSortOption get getCurrentSortOption => _currentSortOption;
}
