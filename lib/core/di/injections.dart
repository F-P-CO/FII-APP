import 'package:dio/dio.dart';
import 'package:fii_app/modules/comparator/presentation/stores/comparator_store.dart';
import 'package:fii_app/modules/home/presentation/stores/navigation_store.dart';
import 'package:fii_app/modules/reit_list/data/datasources/local_reit_list_settings_data_source.dart';
import 'package:fii_app/modules/reit_list/data/repositories/default_reit_list_settings_repository.dart';
import 'package:fii_app/modules/reit_list/domain/repositories/reit_list_settings_repository.dart';
import 'package:fii_app/modules/reit_list/domain/usecases/get_enabled_lists.dart';
import 'package:fii_app/modules/reit_list/domain/usecases/get_list_limit.dart';
import 'package:fii_app/modules/reit_list/domain/usecases/save_enabled_lists.dart';
import 'package:fii_app/modules/reit_list/domain/usecases/save_list_limit.dart';
import 'package:fii_app/modules/reit_list/presentation/stores/reit_list_settings_store.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../modules/reit_list/domain/usecases/get_all_reits.dart';
import '../data/datasources/funds_explorer_reit_data_source.dart';
import '../data/datasources/reit_data_source.dart';
import '../data/repositories/default_reit_repository.dart';
import '../domain/repositories/reit_repository.dart';
import '../navigation/navigator_service.dart';
import '../network/http_client.dart';
import '../presentation/stores/reit_list_store.dart';

GetIt _getIt = GetIt.instance;

void init() {
  _registerNetworkServices();
  _registerStorageServices();
  _registerNavigationServices();
  _registerCoreServices();
  _registerFeatureServices();
  _registerExternalServices();
}

void _registerNetworkServices() {
  _getIt.registerSingleton<Dio>(Dio());

  _getIt.registerSingleton(HttpClient(_getIt()));
}

void _registerStorageServices() {
  _getIt.registerSingletonAsync<SharedPreferences>(
    () => SharedPreferences.getInstance(),
  );
}

void _registerNavigationServices() {
  _getIt.registerSingleton(NavigatorService());
  _getIt.registerSingleton(NavigationStore());
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

  // ! Stores
  _getIt.registerLazySingleton(
    () => ReitListStore(
      getAllReits: _getIt(),
    )..loadReitList(),
  );
}

void _registerFeatureServices() {
  // ! Reit List - Datasources
  _getIt.registerSingletonWithDependencies<LocalReitSettingsDataSource>(
    () => LocalReitSettingsDataSource(sharedPreferences: _getIt()),
    dependsOn: [
      SharedPreferences,
    ],
  );

  // ! Reit List - Repositories
  _getIt.registerSingletonWithDependencies<ReitListSettingsRepository>(
    () => DefaultReitListSettingsRepository(
      localDatasource: _getIt(),
    ),
    dependsOn: [
      LocalReitSettingsDataSource,
    ],
  );

  // ! Reit List - Use cases
  _getIt.registerLazySingleton<GetAllReits>(
    () => GetAllReits(reitRepository: _getIt()),
  );

  _getIt.registerSingletonWithDependencies<GetEnabledLists>(
    () => GetEnabledLists(reitListSettingsRepository: _getIt()),
    dependsOn: [
      ReitListSettingsRepository,
    ],
  );

  _getIt.registerSingletonWithDependencies<SaveEnabledLists>(
    () => SaveEnabledLists(reitListSettingsRepository: _getIt()),
    dependsOn: [
      ReitListSettingsRepository,
    ],
  );

  _getIt.registerSingletonWithDependencies<GetListLimit>(
    () => GetListLimit(reitListSettingsRepository: _getIt()),
    dependsOn: [
      ReitListSettingsRepository,
    ],
  );

  _getIt.registerSingletonWithDependencies<SaveListLimit>(
    () => SaveListLimit(reitListSettingsRepository: _getIt()),
    dependsOn: [
      ReitListSettingsRepository,
    ],
  );

  // ! Reit List - Stores
  _getIt.registerSingletonWithDependencies(
    () => ReitListSettingsStore(
      getEnabledLists: _getIt(),
      saveEnabledLists: _getIt(),
      getListLimit: _getIt(),
      saveListLimit: _getIt(),
    )..init(),
    dependsOn: [
      SaveEnabledLists,
    ],
  );

  // ! Comparator - Stores
  _getIt.registerLazySingleton(
    () => ComparatorStore(
      reitListStore: _getIt(),
    ),
  );
}

void _registerExternalServices() {
  // ! Utils
  _getIt.registerLazySingleton<NumberFormat>(
    () =>
        NumberFormat.currency(locale: 'pt_BR', decimalDigits: 2, symbol: 'R\$'),
  );
}
