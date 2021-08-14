import 'package:fii_app/core/presentation/themes/app_colors.dart';
import 'package:fii_app/core/presentation/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class HeaderAppBarComponent extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final void Function()? settingsOnPressed;
  final void Function()? favoritesOnPressed;
  final void Function()? searchOnPressed;

  // @override
  // Size get preferredSize => showSearch
  //     ? const Size.fromHeight(110)
  //     : const Size.fromHeight(kToolbarHeight);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const HeaderAppBarComponent({
    Key? key,
    required this.title,
    this.settingsOnPressed,
    this.favoritesOnPressed,
    this.searchOnPressed,
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
        if (searchOnPressed != null)
          IconButton(
            onPressed: searchOnPressed,
            icon: const Icon(Icons.search),
            color: AppColors.grey,
            splashRadius: 20,
          ),
      ],
    );
  }
}
