import 'package:flutter/material.dart';

import '../../domain/entities/reit_column.dart';

abstract class ReitSettingsFilter {
  final ReitColumn column;
  final bool Function() disable;
  final void Function()? onToggle;

  ReitSettingsFilter({
    required this.column,
    required this.disable,
    this.onToggle,
  });
}

class ReitSettingsInputFilter extends ReitSettingsFilter {
  final String? prefix;
  final String? suffix;
  final TextInputType? keyboardType;
  final int? maxLength;

  final List<double?> Function() currentRange;
  final void Function(double?, double?)? onChange;

  ReitSettingsInputFilter({
    required ReitColumn column,
    void Function()? onToggle,
    required bool Function() disable,
    this.prefix,
    this.suffix,
    this.keyboardType,
    this.maxLength,
    required this.currentRange,
    this.onChange,
  }) : super(column: column, disable: disable, onToggle: onToggle);
}

class ReitSettingsSliderFilter extends ReitSettingsFilter {
  final double Function() min;
  final double Function() max;
  final List<double> Function() currentRange;
  final void Function(double, double)? onChange;

  ReitSettingsSliderFilter({
    required ReitColumn column,
    void Function()? onToggle,
    required bool Function() disable,
    required this.min,
    required this.max,
    required this.currentRange,
    this.onChange,
  }) : super(column: column, disable: disable, onToggle: onToggle);
}
