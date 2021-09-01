import 'package:fii_app/core/domain/entities/reit.dart';
import 'package:fii_app/core/presentation/stores/reit_list_store.dart';
import 'package:fii_app/modules/comparator/presentation/models/comparator_filter.dart';
import 'package:mobx/mobx.dart';
part 'comparator_store.g.dart';

class ComparatorStore = _ComparatorStoreBase with _$ComparatorStore;

abstract class _ComparatorStoreBase with Store {
  final ReitListStore _reitListStore;

  _ComparatorStoreBase({
    required ReitListStore reitListStore,
  }) : _reitListStore = reitListStore;

  @observable
  ComparatorFilter filter = ComparatorFilter();

  @computed
  List<Reit> get currentReits {
    List<Reit> reits = _reitListStore.reits;

    if (filter.isSearchEnabled()) {
      reits = reits
          .where(
            (reit) =>
                reit.symbol
                    .toLowerCase()
                    .contains(filter.search!.toLowerCase()) ||
                reit.sector
                    .toLowerCase()
                    .contains(filter.search!.toLowerCase()),
          )
          .toList();
    }

    return reits;
  }

  @action
  void changeSearchFilter(String value) =>
      filter = filter.copyWith(search: value);
}
