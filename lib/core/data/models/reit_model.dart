import '../../domain/entities/reit.dart';

class ReitModel extends Reit {
  ReitModel({
    required String symbol,
    required String name,
    required String sector,
    required double? currentPrice,
    required double? dailyLiquidity,
    required double? currentDividend,
    required double? currentDividendYield,
    required double? netWorth,
    required double? vpa,
    required double? pvpa,
    required double? vacancy,
    required int assetsAmount,
  }) : super(
          symbol: symbol,
          name: name,
          sector: sector,
          currentPrice: currentPrice,
          dailyLiquidity: dailyLiquidity,
          currentDividend: currentDividend,
          currentDividendYield: currentDividendYield,
          netWorth: netWorth,
          vpa: vpa,
          pvpa: pvpa,
          vacancy: vacancy,
          assetsAmount: assetsAmount,
        );

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'name': name,
      'sector': sector,
      'currentPrice': currentPrice,
      'dailyLiquidity': dailyLiquidity,
      'currentDividend': currentDividend,
      'currentDividendYield': currentDividendYield,
      'netWorth': netWorth,
      'vpa': vpa,
      'pvpa': pvpa,
      'vacancy': vacancy,
      'assetsAmount': assetsAmount,
    };
  }
}
