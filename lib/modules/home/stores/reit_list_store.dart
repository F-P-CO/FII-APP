import 'package:fii_app/shared/models/reit.dart';
import 'package:fii_app/modules/home/models/reit_list_sort_option.dart';
import 'package:fii_app/shared/repositories/reit_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'reit_list_store.g.dart';

class ReitListStore = _ReitListStoreBase with _$ReitListStore;

abstract class _ReitListStoreBase with Store {
  final repository = GetIt.I.get<ReitRepository>();

  @observable
  bool isLoading = false;

  @observable
  bool hasError = false;

  @observable
  List<Reit> reits = [];

  @observable
  ReitListSortOption currentSortOption = _sortOptions
      .singleWhere((option) => option.type == ReitListSortOptionType.netWorth);

  static const _sortOptions = [
    ReitListSortOption(
      label: "Patrimônio Liquído",
      type: ReitListSortOptionType.netWorth,
    ),
    ReitListSortOption(
      label: "Dividend Yield Atual",
      type: ReitListSortOptionType.currentDividendYield,
    ),
    ReitListSortOption(
      label: "Quantidade de Ativos",
      type: ReitListSortOptionType.assetsAmount,
    ),
  ];

  @computed
  List<Reit> get sortedReits {
    final List<Reit> localReits = reits;
    switch (currentSortOption.type) {
      case ReitListSortOptionType.assetsAmount:
        localReits.sort((a, b) => b.assetsAmount.compareTo(a.assetsAmount));
        break;
      case ReitListSortOptionType.netWorth:
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
  Future<void> fetchAll() async {
    try {
      isLoading = true;
      reits = await repository.getAll();
    } finally {
      isLoading = false;
    }
  }

  List<ReitListSortOption> get sortOptions => _sortOptions;
}
