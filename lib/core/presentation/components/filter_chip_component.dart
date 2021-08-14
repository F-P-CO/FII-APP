import 'package:fii_app/core/presentation/themes/app_colors.dart';
import 'package:fii_app/core/presentation/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class FilterChipComponent extends StatelessWidget {
  final String label;
  final bool active;
  final void Function() onTap;

  const FilterChipComponent({
    Key? key,
    required this.label,
    this.active = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      splashColor: AppColors.primary.withOpacity(0.1),
      highlightColor: AppColors.primary.withOpacity(0.1),
      child: Ink(
        decoration: BoxDecoration(
          color: active ? AppColors.primary : AppColors.primaryText,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: AppColors.primary,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
          child: Text(
            label,
            style: AppTextStyles.primaryFont.copyWith(
              fontSize: 12,
              fontWeight: AppTextStyles.primaryFontWeightSemibold,
              color: active ? AppColors.primaryText : AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
