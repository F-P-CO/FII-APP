import 'package:equatable/equatable.dart';

enum ReitListSortOptionType { netWorth, currentDividendYield, assetsAmount }

class ReitListSortOption extends Equatable {
  final String label;
  final ReitListSortOptionType type;

  const ReitListSortOption({
    required this.label,
    required this.type,
  });

  @override
  List<Object?> get props => [label, type];
}
