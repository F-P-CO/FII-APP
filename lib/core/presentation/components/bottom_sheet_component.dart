import 'package:fii_app/core/presentation/themes/app_colors.dart';
import 'package:fii_app/core/presentation/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class BottomSheetComponent extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const BottomSheetComponent({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 18, bottom: 10),
            child: Container(
              height: 5.0,
              width: 150.0,
              decoration: BoxDecoration(
                color: AppColors.lightgrey,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 5),
          child: Text(
            title,
            style: AppTextStyles.largeBoldHeader,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 16.0,
            left: 16.0,
            right: 16.0,
            bottom: 48.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ],
    );
  }
}
