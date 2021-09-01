import 'package:fii_app/core/presentation/components/range_slider_component.dart';
import 'package:fii_app/core/presentation/themes/app_colors.dart';
import 'package:fii_app/core/presentation/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class RangeSliderFilterComponent extends StatelessWidget {
  final String title;
  final int min;
  final int max;
  final RangeValues currentRange;
  final bool disable;
  final void Function(RangeValues)? onChanged;

  const RangeSliderFilterComponent({
    Key? key,
    required this.title,
    this.disable = false,
    required this.min,
    required this.max,
    required this.currentRange,
    this.onChanged,
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
            children: [
              Text(
                title,
                style: disable
                    ? AppTextStyles.header.copyWith(color: AppColors.mediumGrey)
                    : AppTextStyles.header,
              ),
            ],
          ),
          RangeSliderComponent(
            min: 0,
            max: 100,
            initialValues: currentRange,
            disable: disable,
          ),
        ],
      ),
    );
  }
}
