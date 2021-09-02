import 'package:fii_app/core/presentation/components/range_slider_component.dart';
import 'package:fii_app/core/presentation/themes/app_colors.dart';
import 'package:fii_app/core/presentation/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class RangeSliderFilterComponent extends StatelessWidget {
  final String title;
  final double min;
  final double max;
  final List<double> currentRange;
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
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: disable
                    ? AppTextStyles.header.copyWith(color: AppColors.mediumGrey)
                    : AppTextStyles.header,
              ),
              Radio(
                groupValue: title,
                value: disable ? 'disabled' : title,
                toggleable: true,
                onChanged: (String? value) {
                  if (onToggle != null) {
                    onToggle!();
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 45.0),
          RangeSliderComponent(
            min: min,
            max: max,
            lowerValue: currentRange.first,
            upperValue: currentRange.last,
            disable: disable,
            onChange: onChange,
          ),
        ],
      ),
    );
  }
}
