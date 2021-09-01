import 'package:fii_app/core/presentation/themes/app_colors.dart';
import 'package:flutter/material.dart';

class RangeSliderComponent extends StatefulWidget {
  final double min;
  final double max;
  final RangeValues initialValues;
  final int? divisions;
  final bool disable;
  final void Function(RangeValues)? onChanged;

  const RangeSliderComponent({
    Key? key,
    required this.min,
    required this.max,
    required this.initialValues,
    this.divisions,
    this.disable = false,
    this.onChanged,
  }) : super(key: key);

  @override
  _RangeSliderComponentState createState() => _RangeSliderComponentState();
}

class _RangeSliderComponentState extends State<RangeSliderComponent> {
  late RangeValues _currentRangeValues;

  @override
  void initState() {
    _currentRangeValues = widget.initialValues;

    super.initState();
  }

  void _onChanged(RangeValues values) {
    if (!widget.disable) {
      setState(() {
        _currentRangeValues = values;
      });

      if (widget.onChanged != null) {
        widget.onChanged!(values);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: widget.disable,
      child: RangeSlider(
        activeColor: widget.disable ? AppColors.lightgrey : null,
        inactiveColor: widget.disable ? AppColors.lightgrey : null,
        values: _currentRangeValues,
        min: widget.min,
        max: widget.max,
        divisions: 5,
        labels: RangeLabels(
          _currentRangeValues.start.round().toString(),
          _currentRangeValues.end.round().toString(),
        ),
        onChanged: _onChanged,
      ),
    );
  }
}
