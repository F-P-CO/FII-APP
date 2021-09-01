import 'package:dartz/dartz.dart';
import 'package:fii_app/core/errors/failures.dart';
import 'package:fii_app/modules/reit_list/domain/entities/reit_list_sort_option.dart';
import 'package:fii_app/modules/reit_list/domain/repositories/reit_list_settings_repository.dart';
import 'package:fii_app/modules/reit_list/domain/usecases/save_enabled_lists.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'save_enabled_lists_test.mocks.dart';

@GenerateMocks([ReitListSettingsRepository])
void main() {
  late MockReitListSettingsRepository mockReitListSettingsRepository;
  late SaveEnabledLists usecase;

  final mockList = [ReitListSortOptionType.assetsAmount];

  setUp(() {
    mockReitListSettingsRepository = MockReitListSettingsRepository();
    usecase = SaveEnabledLists(
        reitListSettingsRepository: mockReitListSettingsRepository);
  });

  test('should save enabled lists on the repository', () async {
    when(mockReitListSettingsRepository.saveEnabledLists(mockList))
        .thenAnswer((_) async => const Right(true));

    final lists = await usecase(mockList);

    expect(lists, const Right(true));
    verify(mockReitListSettingsRepository.saveEnabledLists(any));
    verifyNoMoreInteractions(mockReitListSettingsRepository);
  });

  test('should return a Failure when repository fails to save list', () async {
    when(mockReitListSettingsRepository.saveEnabledLists(any))
        .thenAnswer((_) async => Left(Failure()));

    final lists = await usecase(mockList);

    expect(lists, equals(Left(Failure())));
    verify(mockReitListSettingsRepository.saveEnabledLists(mockList));
    verifyNoMoreInteractions(mockReitListSettingsRepository);
  });
}
