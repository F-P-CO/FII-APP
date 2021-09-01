import 'package:fii_app/core/presentation/themes/app_colors.dart';
import 'package:fii_app/core/presentation/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class PageAppBarComponent extends StatelessWidget
    implements PreferredSizeWidget {
  static const double height = 65;

  final String title;
  final void Function()? closeOnPressed;

  @override
  Size get preferredSize => const Size.fromHeight(height);

  const PageAppBarComponent({
    Key? key,
    required this.title,
    this.closeOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: height,
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: AppTextStyles.largeHeader,
      ),
      actions: [
        if (closeOnPressed != null)
          IconButton(
            icon: const Icon(Icons.close),
            color: AppColors.blackGrey,
            splashRadius: 20,
            onPressed: closeOnPressed,
          )
      ],
    );
  }
}
