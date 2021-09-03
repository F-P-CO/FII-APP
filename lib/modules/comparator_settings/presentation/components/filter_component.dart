import 'package:fii_app/core/presentation/themes/app_colors.dart';
import 'package:fii_app/core/presentation/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class FilterComponent extends StatelessWidget {
  final String title;
  final bool disable;
  final void Function()? onToggle;
  final Widget child;

  const FilterComponent({
    Key? key,
    required this.title,
    required this.disable,
    this.onToggle,
    required this.child,
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
                onChanged: (String? value) => onToggle?.call(),
              ),
            ],
          ),
          const SizedBox(height: 45.0),
          child,
        ],
      ),
    );
  }
}
