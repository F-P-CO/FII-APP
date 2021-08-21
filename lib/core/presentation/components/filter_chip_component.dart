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
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: active ? AppColors.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: AppColors.primary,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(100),
        splashColor: active
            ? AppColors.primaryText.withOpacity(0.1)
            : AppColors.primaryText.withOpacity(0.1),
        highlightColor: active
            ? AppColors.primary.withOpacity(0.1)
            : AppColors.primary.withOpacity(0.1),
        child: Ink(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
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
      ),
    );
  }
}
