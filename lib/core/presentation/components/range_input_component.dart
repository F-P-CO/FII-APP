import 'package:fii_app/core/presentation/components/input_component.dart';
import 'package:flutter/material.dart';

class RangeInputComponent extends StatefulWidget {
  final List<double?>? currentRange;
  final String leftLabel;
  final String rightLabel;
  final TextInputType? keyboardType;
  final int? maxLength;
  final String? prefix;
  final String? suffix;
  final void Function(double?, double?)? onChange;

  const RangeInputComponent({
    Key? key,
    this.currentRange,
    required this.leftLabel,
    required this.rightLabel,
    this.keyboardType,
    this.maxLength,
    this.prefix,
    this.suffix,
    this.onChange,
  }) : super(key: key);

  @override
  _RangeInputComponentState createState() => _RangeInputComponentState();
}

class _RangeInputComponentState extends State<RangeInputComponent> {
  late final minController = TextEditingController(
    text: widget.currentRange?.first?.toString().replaceAll('.', ','),
  );
  late final maxController = TextEditingController(
    text: widget.currentRange?.last?.toString().replaceAll('.', ','),
  );

  @override
  void dispose() {
    minController.dispose();
    maxController.dispose();
    super.dispose();
  }

  void _onChange(String value) {
    final min = double.tryParse(minController.text.replaceAll(',', '.'));
    final max = double.tryParse(maxController.text.replaceAll(',', '.'));

    widget.onChange?.call(min, max);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: InputComponent(
            controller: minController,
            labelText: widget.leftLabel,
            keyboardType: widget.keyboardType,
            maxLength: widget.maxLength,
            prefix: widget.prefix,
            suffix: widget.suffix,
            onChanged: _onChange,
          ),
        ),
        const SizedBox(width: 24.0),
        Flexible(
          child: InputComponent(
            controller: maxController,
            labelText: widget.rightLabel,
            keyboardType: widget.keyboardType,
            maxLength: widget.maxLength,
            prefix: widget.prefix,
            suffix: widget.suffix,
            onChanged: _onChange,
          ),
        ),
      ],
    );
  }
}
