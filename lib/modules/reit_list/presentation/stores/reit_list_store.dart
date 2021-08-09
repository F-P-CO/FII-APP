import 'package:fii_app/core/errors/failures.dart';
import 'package:mobx/mobx.dart';

import 'package:fii_app/core/domain/entities/reit.dart';
import '../../domain/usecases/get_all_reits.dart';

part 'reit_list_store.g.dart';

class ReitListStore = _ReitListStoreBase with _$ReitListStore;

enum ReitListSortOptionType { netWorth, currentDividendYield, assetsAmount }

class ReitListSortOption {
  final String label;
  final ReitListSortOptionType type;

  const ReitListSortOption({
    required this.label,
    required this.type,
  });
}

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

  @observable
  ReitListSortOptionType currentSortOption = ReitListSortOptionType.netWorth;

  @observable
  int limit = 10;

  @computed
  List<Reit> get sortedReits {
    final List<Reit> localReits = reits;

    switch (currentSortOption) {
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

    if (limit == 0) {
      return localReits;
    } else {
      return localReits.take(limit).toList();
    }
  }

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

  List<ReitListSortOption> get sortOptions => _sortOptions;
}
