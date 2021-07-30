import 'package:fii_app/shared/hooks/use_navigator_service_hook.dart';
import 'package:mobx/mobx.dart';
part 'reit_store.g.dart';

class ReitStore = _ReitStoreBase with _$ReitStore;

abstract class _ReitStoreBase with Store {
  final String text = 'Hello World';
  final navigator = useNavigatorService();
}
