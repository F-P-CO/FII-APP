import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

import '../../modules/reit_list/domain/usecases/get_all_reits.dart';
import '../../modules/reit_list/presentation/stores/reit_list_store.dart';
import '../data/datasources/funds_explorer_reit_data_source.dart';
import '../data/datasources/reit_data_source.dart';
import '../data/repositories/default_reit_repository.dart';
import '../domain/repositories/reit_repository.dart';
import '../navigation/navigator_service.dart';
import '../network/http_client.dart';

GetIt _getIt = GetIt.instance;

void init() {
  _registerNetworkServices();
  _registerNavigationServices();
  _registerCoreServices();
  _registerFeatureServices();
  _registerExternalServices();
}

void _registerNetworkServices() {
  _getIt.registerSingleton<Dio>(Dio());

  _getIt.registerSingleton(HttpClient(_getIt()));
}

void _registerNavigationServices() {
  _getIt.registerSingleton(NavigatorService());
}

void _registerCoreServices() {
  // ! Datasources
  _getIt.registerLazySingleton<ReitDataSource>(
    () => FundsExplorerReitDataSource(
      httpClient: _getIt(),
    ),
  );

  // ! Repositories
  _getIt.registerLazySingleton<ReitRepository>(
    () => DefaultReitRepository(
      datasource: _getIt(),
    ),
  );
}

void _registerFeatureServices() {
  // ! Stores
  _getIt.registerLazySingleton(
    () => ReitListStore(
      getAllReits: _getIt(),
    )..loadReitList(),
  );

  // ! Use cases
  _getIt.registerLazySingleton<GetAllReits>(
    () => GetAllReits(reitRepository: _getIt()),
  );
}

void _registerExternalServices() {
  // ! Utils
  _getIt.registerLazySingleton<NumberFormat>(
    () =>
        NumberFormat.currency(locale: 'pt_BR', decimalDigits: 2, symbol: 'R\$'),
  );
}
