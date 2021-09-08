import 'package:equatable/equatable.dart';

enum ReitColumnType {
  sector,
  currentPrice,
  dailyLiquidity,
  currentDividend,
  currentDividendYield,
  netWorth,
  vpa,
  pvpa,
  vacancy,
  assetsAmount
}

class ReitColumn extends Equatable {
  final ReitColumnType type;

  const ReitColumn({
    required this.type,
  });

  String get label {
    final Map<ReitColumnType, String> labels = {
      ReitColumnType.sector: "Setor",
      ReitColumnType.currentPrice: "Preço Atual",
      ReitColumnType.dailyLiquidity: "Liquidez Diária",
      ReitColumnType.currentDividend: "Dividendo Atual",
      ReitColumnType.currentDividendYield: "Dividend Yield Atual",
      ReitColumnType.netWorth: "Patrimônio Liquído",
      ReitColumnType.vpa: "VPA",
      ReitColumnType.pvpa: "P / VPA",
      ReitColumnType.vacancy: "Vacância",
      ReitColumnType.assetsAmount: "Número de ativos",
    };

    final label = labels[type];

    if (label == null) {
      throw Exception("No label found for type $type");
    }

    return label;
  }

  @override
  List<Object> get props => [type];
}
