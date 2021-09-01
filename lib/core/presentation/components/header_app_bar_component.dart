import 'package:fii_app/core/presentation/components/header_app_bar_search_component.dart';
import 'package:fii_app/core/presentation/themes/app_colors.dart';
import 'package:fii_app/core/presentation/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class HeaderAppBarComponent extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final void Function()? settingsOnPressed;
  final void Function()? favoritesOnPressed;
  final void Function()? searchButtonOnPressed;
  final void Function(String)? searchOnChange;

  @override
  Size get preferredSize {
    final extraHeight = searchOnChange != null ? 60 : 0;
    return Size.fromHeight(kToolbarHeight + extraHeight);
  }

  const HeaderAppBarComponent({
    Key? key,
    required this.title,
    this.settingsOnPressed,
    this.favoritesOnPressed,
    this.searchButtonOnPressed,
    this.searchOnChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      title: Text(
        title,
        style: AppTextStyles.largeHeader,
      ),
      bottom: searchOnChange != null
          ? HeaderAppBarSearchComponent(
              onChange: searchOnChange!,
            )
          : null,
      actions: [
        if (settingsOnPressed != null)
          IconButton(
            onPressed: settingsOnPressed,
            icon: const Icon(Icons.tune),
            color: AppColors.grey,
            splashRadius: 20,
          ),
        if (favoritesOnPressed != null)
          IconButton(
            onPressed: favoritesOnPressed,
            icon: const Icon(Icons.favorite_border),
            color: AppColors.grey,
            splashRadius: 20,
          ),
        if (searchButtonOnPressed != null)
          IconButton(
            onPressed: searchButtonOnPressed,
            icon: const Icon(Icons.search),
            color: AppColors.grey,
            splashRadius: 20,
          ),
      ],
    );
  }
}
