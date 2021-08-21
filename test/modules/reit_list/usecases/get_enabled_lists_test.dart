import 'package:fii_app/modules/reit_list/domain/entities/reit_list_sort_option.dart';
import 'package:fii_app/modules/reit_list/domain/repositories/reit_list_settings_repository.dart';
import 'package:fii_app/modules/reit_list/domain/usecases/get_enabled_lists.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_enabled_lists_test.mocks.dart';

@GenerateMocks([ReitListSettingsRepository])
void main() {
  late MockReitListSettingsRepository mockReitListSettingsRepository;
  late GetEnabledLists usecase;

  final mockList = [ReitListSortOptionType.assetsAmount];

  setUp(() {
    mockReitListSettingsRepository = MockReitListSettingsRepository();
    usecase = GetEnabledLists(
        reitListSettingsRepository: mockReitListSettingsRepository);
  });

  test('should get list of enabled lists from the repository', () async {
    when(mockReitListSettingsRepository.getEnabledLists())
        .thenAnswer((_) async => mockList);

    final lists = await usecase();

    expect(lists, mockList);
    verify(mockReitListSettingsRepository.getEnabledLists());
    verifyNoMoreInteractions(mockReitListSettingsRepository);
  });
}
