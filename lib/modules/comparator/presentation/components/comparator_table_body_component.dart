import 'package:fii_app/core/presentation/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class ComparatorTableBodyComponent extends StatelessWidget {
  final String text;

  const ComparatorTableBodyComponent({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        text,
        style: AppTextStyles.primaryFont,
      ),
    );
  }
}
