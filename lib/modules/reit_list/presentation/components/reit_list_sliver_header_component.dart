import 'package:fii_app/core/domain/entities/reit_column.dart';
import 'package:fii_app/core/presentation/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class ReitListSliverHeaderComponent extends StatelessWidget {
  final ReitColumn sortOption;

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
