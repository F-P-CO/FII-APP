import 'package:fii_app/core/errors/failures.dart';
import 'package:fii_app/modules/reit_list/domain/entities/reit_list_sort_option.dart';
import 'package:mobx/mobx.dart';

import 'package:fii_app/core/domain/entities/reit.dart';
import '../../../modules/reit_list/domain/usecases/get_all_reits.dart';

part 'reit_list_store.g.dart';

class ReitListStore = _ReitListStoreBase with _$ReitListStore;

abstract class _ReitListStoreBase with Store {
  final GetAllReits getAllReits;

  _ReitListStoreBase({required this.getAllReits});

  @observable
  bool isLoading = false;

  @observable
  String errorMessage = '';

  @computed
  bool get hasError => errorMessage.isNotEmpty;

  @observable
  List<Reit> reits = [];

  @computed
  int get totalReits => reits.length;

  final sortOptions = [
    const ReitListSortOption(
      label: "Patrimônio Liquído",
      type: ReitListSortOptionType.netWorth,
    ),
    const ReitListSortOption(
      label: "Dividend Yield Atual",
      type: ReitListSortOptionType.currentDividendYield,
    ),
    const ReitListSortOption(
      label: "Quantidade de Ativos",
      type: ReitListSortOptionType.assetsAmount,
    ),
  ];

  @action
  Future<void> loadReitList() async {
    try {
      isLoading = true;

      final reitsOrFailure = await getAllReits();

      reitsOrFailure.fold(
        (failure) {
          if (failure is ServerFailure) {
            errorMessage =
                'Ocorreu um erro ao buscar as informações no servidor';
          } else if (failure is UnexpectedFailure) {
            errorMessage = 'Ocorreu um erro inesperado.';
          }
        },
        (list) => reits = list,
      );
    } finally {
      isLoading = false;
    }
  }

  @computed
  List<Reit> get reitsSortedByNetWorth {
    final List<Reit> localReits = reits;
    localReits.sort((a, b) => b.netWorth?.compareTo(a.netWorth ?? 0) ?? 0);

    return localReits;
  }

  @computed
  List<Reit> get reitsSortedByAssetsAmount {
    final List<Reit> localReits = reits;
    localReits.sort((a, b) => b.assetsAmount.compareTo(a.assetsAmount));

    return localReits;
  }

  @computed
  List<Reit> get reitsSortedByCurrentDividendYield {
    final List<Reit> localReits = reits;
    localReits.sort((a, b) =>
        b.currentDividendYield?.compareTo(a.currentDividendYield ?? 0) ?? 0);

    return localReits;
  }

  List<Reit> getReitsSortedBy(ReitListSortOptionType sortType) {
    final key = sortType;

    if (_mapSortTypeToReitList.containsKey(key)) {
      return _mapSortTypeToReitList[key]!;
    }

    throw ArgumentError('Sort option not found on Sort Map.');
  }

  Map<ReitListSortOptionType, List<Reit>> get _mapSortTypeToReitList => {
        ReitListSortOptionType.netWorth: reitsSortedByNetWorth,
        ReitListSortOptionType.currentDividendYield:
            reitsSortedByCurrentDividendYield,
        ReitListSortOptionType.assetsAmount: reitsSortedByAssetsAmount,
      };
}
