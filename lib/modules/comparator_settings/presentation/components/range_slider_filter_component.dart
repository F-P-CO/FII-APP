import 'package:fii_app/core/presentation/components/range_slider_component.dart';
import 'package:fii_app/modules/comparator_settings/presentation/components/filter_component.dart';
import 'package:flutter/material.dart';

class RangeSliderFilterComponent extends StatelessWidget {
  final String title;
  final double min;
  final double max;
  final List<double>? currentRange;
  final bool disable;
  final void Function(double, double)? onChange;
  final void Function()? onToggle;

  const RangeSliderFilterComponent({
    Key? key,
    required this.title,
    this.disable = false,
    required this.min,
    required this.max,
    required this.currentRange,
    this.onChange,
    this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilterComponent(
      title: title,
      disable: disable,
      onToggle: onToggle,
      child: RangeSliderComponent(
        min: min,
        max: max,
        lowerValue: currentRange != null ? currentRange!.first : min,
        upperValue: currentRange != null ? currentRange!.last : max,
        disable: disable,
        onChange: onChange,
      ),
    );
  }
}
