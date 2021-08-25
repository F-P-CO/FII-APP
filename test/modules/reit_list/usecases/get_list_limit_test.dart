import 'package:fii_app/modules/reit_list/domain/repositories/reit_list_settings_repository.dart';
import 'package:fii_app/modules/reit_list/domain/usecases/get_list_limit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_list_limit_test.mocks.dart';

@GenerateMocks([ReitListSettingsRepository])
void main() {
  late MockReitListSettingsRepository mockReitListSettingsRepository;
  late GetListLimit usecase;

  const mockLimit = 100;

  setUp(() {
    mockReitListSettingsRepository = MockReitListSettingsRepository();
    usecase = GetListLimit(
        reitListSettingsRepository: mockReitListSettingsRepository);
  });

  test('should get list limit from the repository', () {
    when(mockReitListSettingsRepository.getListLimit()).thenReturn(mockLimit);

    final limit = usecase();

    expect(limit, equals(mockLimit));
    verify(mockReitListSettingsRepository.getListLimit());
    verifyNoMoreInteractions(mockReitListSettingsRepository);
  });
}
