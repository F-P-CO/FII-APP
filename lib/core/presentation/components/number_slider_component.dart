import 'package:flutter/material.dart';

class NumberSliderComponent extends StatefulWidget {
  final double min;
  final double max;
  final double initialValue;
  final int? divisions;
  final void Function(double)? onChanged;

  const NumberSliderComponent({
    Key? key,
    required this.min,
    required this.max,
    required this.initialValue,
    this.divisions,
    this.onChanged,
  }) : super(key: key);

  @override
  _NumberSliderComponentState createState() => _NumberSliderComponentState();
}

class _NumberSliderComponentState extends State<NumberSliderComponent> {
  late double _currentSliderValue;

  @override
  void initState() {
    _currentSliderValue = widget.initialValue;

    super.initState();
  }

  void _onChanged(double value) {
    setState(() {
      _currentSliderValue = value;
    });

    if (widget.onChanged != null) {
      widget.onChanged!(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      min: widget.min,
      max: widget.max,
      label: _currentSliderValue.round().toString(),
      divisions: widget.divisions ?? widget.max.round(),
      onChanged: _onChanged,
    );
  }
}
