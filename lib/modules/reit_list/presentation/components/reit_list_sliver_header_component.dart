import 'package:fii_app/core/presentation/themes/app_text_styles.dart';
import 'package:fii_app/modules/reit_list/domain/entities/reit_list_sort_option.dart';
import 'package:flutter/material.dart';

class ReitListSliverHeaderComponent extends StatelessWidget {
  final ReitListSortOption sortOption;

  const ReitListSliverHeaderComponent({Key? key, required this.sortOption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          "De maior ${sortOption.label.toLowerCase()}",
          style: AppTextStyles.header,
        ),
      ),
    );
  }
}
