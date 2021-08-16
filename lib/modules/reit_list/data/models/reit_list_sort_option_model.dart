import 'dart:convert';

import 'package:fii_app/modules/reit_list/domain/entities/reit_list_sort_option.dart';

class ReitListSortOptionModel extends ReitListSortOption {
  const ReitListSortOptionModel({
    required String label,
    required ReitListSortOptionType type,
  }) : super(label: label, type: type);

  ReitListSortOption copyWith({
    String? label,
    ReitListSortOptionType? type,
  }) {
    return ReitListSortOption(
      label: label ?? this.label,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'type': type.index,
    };
  }

  factory ReitListSortOptionModel.fromMap(Map<String, dynamic> map) {
    return ReitListSortOptionModel(
      label: map['label'] as String,
      type: ReitListSortOptionType.values[map['type'] as int],
    );
  }

  String toJson() => json.encode(toMap());

  factory ReitListSortOptionModel.fromJson(String source) =>
      ReitListSortOptionModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ReitListSortOption(label: $label, type: $type)';
}
