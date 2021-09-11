import 'package:fii_app/core/domain/entities/reit.dart';
import 'package:fii_app/core/domain/entities/reit_column.dart';
import 'package:fii_app/core/errors/failures.dart';
import 'package:mobx/mobx.dart';

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
    final List<Reit> localReits = [...reits];
    localReits.sort((a, b) => b.netWorth?.compareTo(a.netWorth ?? 0) ?? 0);

    return localReits;
  }

  @computed
  List<Reit> get reitsSortedByAssetsAmount {
    final List<Reit> localReits = [...reits];
    localReits.sort((a, b) => b.assetsAmount.compareTo(a.assetsAmount));

    return localReits;
  }

  @computed
  List<Reit> get reitsSortedByCurrentDividendYield {
    final List<Reit> localReits = [...reits];
    localReits.sort((a, b) =>
        b.currentDividendYield?.compareTo(a.currentDividendYield ?? 0) ?? 0);

    return localReits;
  }

  @computed
  List<Reit> get reitsSortedByVacancy {
    final List<Reit> localReits = [...reits];
    localReits.sort((a, b) => b.vacancy?.compareTo(a.vacancy ?? 0) ?? 0);

    return localReits;
  }

  List<Reit> getReitsSortedBy(ReitColumnType sortType) {
    final key = sortType;

    if (_mapSortTypeToReitList.containsKey(key)) {
      return _mapSortTypeToReitList[key]!;
    }

    throw ArgumentError('Sort option not found on Sort Map.');
  }

  Map<ReitColumnType, List<Reit>> get _mapSortTypeToReitList => {
        ReitColumnType.netWorth: reitsSortedByNetWorth,
        ReitColumnType.currentDividendYield: reitsSortedByCurrentDividendYield,
        ReitColumnType.assetsAmount: reitsSortedByAssetsAmount,
        ReitColumnType.vacancy: reitsSortedByVacancy,
      };
}
