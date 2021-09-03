import 'package:fii_app/core/presentation/themes/app_colors.dart';
import 'package:fii_app/core/presentation/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class RangeSliderComponent extends StatefulWidget {
  final double min;
  final double max;
  final double lowerValue;
  final double upperValue;
  final bool disable;
  final void Function(double, double)? onChange;

  const RangeSliderComponent({
    Key? key,
    required this.min,
    required this.max,
    required this.lowerValue,
    required this.upperValue,
    this.disable = false,
    this.onChange,
  }) : super(key: key);

  @override
  _RangeSliderComponentState createState() => _RangeSliderComponentState();
}

class _RangeSliderComponentState extends State<RangeSliderComponent> {
  late double _lowerValue;
  late double _upperValue;

  @override
  void initState() {
    _lowerValue = widget.lowerValue;
    _upperValue = widget.upperValue;

    super.initState();
  }

  void _onChange(handlerIndex, lowerValue, upperValue) {
    if (!widget.disable) {
      setState(() {
        _lowerValue = lowerValue as double;
        _upperValue = upperValue as double;
      });

      widget.onChange?.call(_lowerValue, _upperValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: widget.disable,
      child: FlutterSlider(
        values: [_lowerValue, _upperValue],
        rangeSlider: true,
        max: widget.max,
        min: widget.min,
        onDragging: _onChange,
        handlerWidth: 25,
        handlerHeight: 25,
        handlerAnimation: const FlutterSliderHandlerAnimation(
          scale: 1,
        ),
        handler: FlutterSliderHandler(
          child: Container(),
        ),
        rightHandler: FlutterSliderHandler(
          child: Container(),
        ),
        trackBar: FlutterSliderTrackBar(
          activeTrackBar: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: widget.disable
                ? AppColors.mediumGrey
                : Theme.of(context).primaryColor,
          ),
        ),
        tooltip: FlutterSliderTooltip(
          alwaysShowTooltip: true,
          positionOffset: FlutterSliderTooltipPositionOffset(top: -30),
          format: (String value) => double.parse(value).toInt().toString(),
          textStyle: AppTextStyles.primaryFont.copyWith(
            fontSize: 16,
            fontWeight: AppTextStyles.primaryFontWeightSemibold,
            color: AppColors.primaryText,
          ),
          boxStyle: FlutterSliderTooltipBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color:
                  widget.disable ? AppColors.mediumGrey : AppColors.blackGrey,
            ),
          ),
        ),
      ),
    );
  }
}
