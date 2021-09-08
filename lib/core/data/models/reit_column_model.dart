import 'dart:convert';

import 'package:fii_app/core/domain/entities/reit_column.dart';

class ReitColumnModel extends ReitColumn {
  const ReitColumnModel({
    required ReitColumnType type,
  }) : super(type: type);

  ReitColumn copyWith({
    ReitColumnType? type,
  }) {
    return ReitColumn(
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type.index,
    };
  }

  factory ReitColumnModel.fromMap(Map<String, dynamic> map) {
    return ReitColumnModel(
      type: ReitColumnType.values[map['type'] as int],
    );
  }

  String toJson() => json.encode(toMap());

  factory ReitColumnModel.fromJson(String source) =>
      ReitColumnModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ReitColumn(type: $type)';
}
