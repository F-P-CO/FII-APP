import 'package:fii_app/core/presentation/themes/app_text_styles.dart';
import 'package:fii_app/modules/reit_list/domain/entities/reit_list_sort_option.dart';
import 'package:fii_app/modules/reit_list/presentation/stores/reit_list_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'reit_card_component.dart';

class ReitListComponent extends StatelessWidget {
  final ReitListSortOptionType sortType;
  final String sortLabel;

  final reitListStore = GetIt.I.get<ReitListStore>();

  ReitListComponent({
    Key? key,
    required this.sortType,
    required this.sortLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "De maior ${sortLabel.toLowerCase()}",
            style: AppTextStyles.header,
          ),
          const SizedBox(height: 8),
          Observer(
            builder: (_) {
              if (reitListStore.isLoading) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 24.0),
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              if (reitListStore.hasError) {
                return Center(
                  child: Text(reitListStore.errorMessage),
                );
              }

              final reits = reitListStore.getReitsSortedBy(sortType);

              return Column(
                children: reits
                    .map(
                      (reit) => ReitCardComponent(
                        reit: reit,
                        sortType: sortType,
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
