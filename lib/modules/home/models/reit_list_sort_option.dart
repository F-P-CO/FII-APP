enum ReitListSortOptionType { netWorth, currentDividendYield, assetsAmount }

class ReitListSortOption {
  final String label;
  final ReitListSortOptionType type;

  const ReitListSortOption({
    required this.label,
    required this.type,
  });
}
