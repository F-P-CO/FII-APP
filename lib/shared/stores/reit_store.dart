import 'package:fii_app/shared/hooks/use_navigator_service_hook.dart';
import 'package:fii_app/shared/models/reit.dart';
import 'package:fii_app/shared/repositories/reit_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'reit_store.g.dart';

class ReitStore = _ReitStoreBase with _$ReitStore;

abstract class _ReitStoreBase with Store {
  final repository = GetIt.I.get<ReitRepository>();

  @observable
  bool hasError = false;

  @observable
  List<Reit> reits = [];

  @observable
  bool isListLoading = false;

  @computed
  List<Reit> get reitsByNetWorth {
    final localReits = reits;
    localReits.sort((a, b) => b.netWorth?.compareTo(a.netWorth ?? 0) ?? 0);
    return localReits.sublist(
        0, localReits.length >= 10 ? 9 : localReits.length);
  }

  final String text = 'Hello World';
  final navigator = useNavigatorService();

  @action
  Future<void> loadReitsList() async {
    try {
      isListLoading = true;
      reits = await repository.getAll();
    } finally {
      isListLoading = false;
    }
  }
}
