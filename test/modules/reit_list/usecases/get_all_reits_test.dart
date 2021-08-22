import 'package:dartz/dartz.dart';
import 'package:fii_app/core/domain/entities/reit.dart';
import 'package:fii_app/core/domain/repositories/reit_repository.dart';
import 'package:fii_app/modules/reit_list/domain/usecases/get_all_reits.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_all_reits_test.mocks.dart';

@GenerateMocks([ReitRepository])
void main() {
  late MockReitRepository mockReitRepository;
  late GetAllReits usecase;

  final mockReitsList = [
    Reit(
      symbol: 'Mock Symbol',
      name: 'Mock Name',
      sector: 'Mock Sector',
      currentPrice: 1,
      dailyLiquidity: 1,
      currentDividend: 1,
      currentDividendYield: 1,
      netWorth: 1,
      vpa: 1,
      pvpa: 1,
      vacancy: 1,
      assetsAmount: 1,
    ),
    Reit(
      symbol: 'Mock Symbol 2',
      name: 'Mock Name 2',
      sector: 'Mock Sector 2',
      currentPrice: 2,
      dailyLiquidity: 2,
      currentDividend: 2,
      currentDividendYield: 2,
      netWorth: 2,
      vpa: 2,
      pvpa: 2,
      vacancy: 2,
      assetsAmount: 2,
    )
  ];

  setUp(() {
    mockReitRepository = MockReitRepository();
    usecase = GetAllReits(reitRepository: mockReitRepository);
  });

  test('should get reits list from the repository', () async {
    when(mockReitRepository.getAll())
        .thenAnswer((_) async => Right(mockReitsList));

    final list = await usecase();

    expect(list, equals(Right(mockReitsList)));
    verify(mockReitRepository.getAll());
    verifyNoMoreInteractions(mockReitRepository);
  });
}
