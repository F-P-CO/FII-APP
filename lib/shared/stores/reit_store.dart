import 'package:fii_app/shared/datasources/funds_explorer_datasource.dart';
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

  final String text = 'Hello World';
  final navigator = useNavigatorService();

  @action
  list() async {
    try {
      isListLoading = true;
      Future.delayed(
        const Duration(seconds: 2),
      );
      final reitsList = await repository.getAll();
      reits = reitsList;
    } catch (e) {
      print(e);
      rethrow;
    } finally {
      isListLoading = false;
    }
  }
}
