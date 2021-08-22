import 'reit_list_sort_option.dart';

class ReitListSettings {
  final List<ReitListSortOptionType> enabledLists;
  final int limit;

  ReitListSettings({
    required this.enabledLists,
    required this.limit,
  });
}
