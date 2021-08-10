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
}
