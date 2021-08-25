import 'package:dartz/dartz.dart';
import 'package:fii_app/core/errors/failures.dart';
import 'package:fii_app/modules/reit_list/domain/repositories/reit_list_settings_repository.dart';
import 'package:fii_app/modules/reit_list/domain/usecases/save_list_limit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'save_list_limit_test.mocks.dart';

@GenerateMocks([ReitListSettingsRepository])
void main() {
  late MockReitListSettingsRepository mockReitListSettingsRepository;
  late SaveListLimit usecase;

  const mockLimit = 100;

  setUp(() {
    mockReitListSettingsRepository = MockReitListSettingsRepository();
    usecase = SaveListLimit(
        reitListSettingsRepository: mockReitListSettingsRepository);
  });

  test('should save list limit on the repository', () async {
    when(mockReitListSettingsRepository.saveListLimit(mockLimit))
        .thenAnswer((_) => Future.value(true));

    final save = await usecase(mockLimit);

    expect(save, const Right(true));
    verify(mockReitListSettingsRepository.saveListLimit(mockLimit));
    verifyNoMoreInteractions(mockReitListSettingsRepository);
  });

  test('should return a Failure when repository fails to save list limit',
      () async {
    when(mockReitListSettingsRepository.saveListLimit(any))
        .thenAnswer((_) => Future.value(false));

    final lists = await usecase(mockLimit);

    expect(lists, equals(Left(LocalStorageFailure())));
    verify(mockReitListSettingsRepository.saveListLimit(mockLimit));
    verifyNoMoreInteractions(mockReitListSettingsRepository);
  });
}
