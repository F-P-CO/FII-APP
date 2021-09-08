import 'package:fii_app/core/presentation/components/range_input_component.dart';
import 'package:flutter/material.dart';

import 'filter_component.dart';

class RangeInputFilterComponent extends StatelessWidget {
  final String title;
  final List<double?> currentRange;
  final bool disable;
  final String leftLabel;
  final String rightLabel;
  final TextInputType? keyboardType;
  final int? maxLength;
  final String? prefix;
  final String? suffix;
  final void Function(double?, double?)? onChange;

  final void Function()? onToggle;

  const RangeInputFilterComponent({
    Key? key,
    required this.title,
    required this.currentRange,
    this.disable = false,
    this.leftLabel = 'Mínimo',
    this.rightLabel = 'Máximo',
    this.keyboardType,
    this.maxLength,
    this.prefix,
    this.suffix,
    this.onChange,
    this.onToggle,
  }) : super(key: key);

  void _onToggle() {
    FocusManager.instance.primaryFocus?.unfocus();
    onToggle?.call();
  }

  @override
  Widget build(BuildContext context) {
    return FilterComponent(
      title: title,
      disable: disable,
      spacing: 15,
      onToggle: _onToggle,
      child: AbsorbPointer(
        absorbing: disable,
        child: Opacity(
          opacity: disable ? 0.5 : 1.0,
          child: RangeInputComponent(
            currentRange: currentRange,
            leftLabel: leftLabel,
            rightLabel: rightLabel,
            prefix: prefix,
            suffix: suffix,
            keyboardType: keyboardType,
            maxLength: maxLength,
            onChange: onChange,
          ),
        ),
      ),
    );
  }
}
