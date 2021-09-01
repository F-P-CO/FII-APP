import 'package:fii_app/core/presentation/themes/app_colors.dart';
import 'package:fii_app/core/presentation/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class HeaderAppBarSearchComponent extends StatelessWidget
    implements PreferredSizeWidget {
  static const double height = 40;
  final void Function(String) onChange;

  const HeaderAppBarSearchComponent({
    Key? key,
    required this.onChange,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.textFieldBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      height: height,
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 16,
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon:
              Icon(Icons.search, color: AppTextStyles.textFieldHint.color),
          hintStyle: AppTextStyles.textFieldHint,
          contentPadding: const EdgeInsets.only(top: 6, bottom: 6, right: 10),
          hintText: 'Buscar',
        ),
        onChanged: onChange,
      ),
    );
  }
}
