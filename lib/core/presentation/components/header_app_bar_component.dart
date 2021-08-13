import 'package:fii_app/core/presentation/themes/app_colors.dart';
import 'package:fii_app/core/presentation/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class HeaderAppBarComponent extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final String? buttonLabel;
  final void Function()? buttonOnPressed;
  final bool showSearch;

  @override
  Size get preferredSize => showSearch
      ? const Size.fromHeight(110)
      : const Size.fromHeight(kToolbarHeight);

  const HeaderAppBarComponent({
    Key? key,
    required this.title,
    this.buttonLabel,
    this.buttonOnPressed,
    this.showSearch = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 5.0,
      shadowColor: AppColors.grey.withOpacity(0.2),
      toolbarHeight: 110,
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextStyles.header.copyWith(
                  color: Colors.black,
                ),
              ),
              if (buttonLabel != null && buttonOnPressed != null)
                TextButton(
                  onPressed: buttonOnPressed,
                  child: Text(
                    buttonLabel!,
                    style: AppTextStyles.buttonLabel
                        .copyWith(color: AppColors.primary),
                  ),
                ),
            ],
          ),
          if (showSearch)
            Container(
              decoration: BoxDecoration(
                color: AppColors.lightgray,
                borderRadius: BorderRadius.circular(8.0),
              ),
              height: 40,
              margin: const EdgeInsets.only(bottom: 10),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: const Icon(Icons.search),
                  hintStyle: AppTextStyles.buttonText,
                  contentPadding:
                      const EdgeInsets.only(top: 6, bottom: 6, right: 10),
                  hintText: 'Buscar',
                ),
              ),
            ),
        ],
      ),
    );
  }
}
