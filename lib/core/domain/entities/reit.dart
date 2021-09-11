import 'package:fii_app/core/domain/entities/reit_column.dart';
import 'package:fii_app/core/helpers/formatter.dart';

typedef TypeToValueMap = Map<ReitColumnType, String Function(Reit)>;

class Reit {
  final String symbol;
  final String name;
  final String sector;
  final double? currentPrice;
  final double? dailyLiquidity;
  final double? currentDividend;
  final double? currentDividendYield;
  // TODO: Verificar se netWorth equivale a Patrimônio Liquído
  final double? netWorth;
  final double? vpa;
  final double? pvpa;
  final double? vacancy;
  final int assetsAmount;

  final TypeToValueMap _typeToValueMap = {
    ReitColumnType.sector: (Reit reit) => reit.sector,
    ReitColumnType.currentPrice: (Reit reit) => reit.formattedCurrentPrice,
    ReitColumnType.dailyLiquidity: (Reit reit) => reit.formattedDailyLiquidity,
    ReitColumnType.currentDividend: (Reit reit) =>
        reit.formattedCurrentDividend,
    ReitColumnType.currentDividendYield: (Reit reit) =>
        reit.formattedCurrentDividendYield,
    ReitColumnType.netWorth: (Reit reit) => reit.formattedNetWorth,
    ReitColumnType.pvpa: (Reit reit) => reit.formattedPvpa,
    ReitColumnType.vpa: (Reit reit) => reit.formattedVpa,
    ReitColumnType.vacancy: (Reit reit) => reit.formattedVacancy,
    ReitColumnType.assetsAmount: (Reit reit) => reit.assetsAmount.toString()
  };

  Reit({
    required this.symbol,
    required this.name,
    required this.sector,
    required this.currentPrice,
    required this.dailyLiquidity,
    required this.currentDividend,
    required this.currentDividendYield,
    required this.netWorth,
    required this.vpa,
    required this.pvpa,
    required this.vacancy,
    required this.assetsAmount,
  });

  String get formattedCurrentPrice => formatCurrency(currentPrice);
  String get formattedDailyLiquidity => formatCurrency(dailyLiquidity);
  String get formattedCurrentDividend => formatPercentage(currentDividend);
  String get formattedCurrentDividendYield =>
      formatPercentage(currentDividendYield);
  String get formattedNetWorth => formatCurrency(netWorth);
  String get formattedPvpa => formatDecimal(pvpa);
  String get formattedVpa => formatCurrency(vpa);
  String get formattedVacancy => formatPercentage(vacancy);

  String getPropertyByType(ReitColumnType type) {
    final valueGetter = _typeToValueMap[type];

    if (valueGetter == null) {
      throw Exception("No valueGetter found for type $type");
    }

    return valueGetter(this);
  }
}
