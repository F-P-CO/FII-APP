import 'package:fii_app/core/presentation/themes/app_text_styles.dart';
import 'package:fii_app/modules/reit_list/presentation/stores/reit_list_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'sort_bottom_sheet_component.dart';

class SortOptionPickerComponent extends StatelessWidget {
  final reitListStore = GetIt.I.get<ReitListStore>();

  SortOptionPickerComponent({Key? key}) : super(key: key);

  void _showOrderingBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => SortBottomSheetComponent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => GestureDetector(
        onTap: () => _showOrderingBottomSheet(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                "Os 10 fundos com maior ${reitListStore.currentSortOptionLabel.toLowerCase()}",
                style: AppTextStyles.semiboldText,
              ),
            ),
            const Icon(Icons.unfold_more)
          ],
        ),
      ),
    );
  }
}
