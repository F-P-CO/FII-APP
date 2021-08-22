import 'package:fii_app/core/presentation/themes/app_colors.dart';
import 'package:fii_app/core/presentation/themes/app_text_styles.dart';
import 'package:fii_app/modules/reit_list/domain/entities/reit_list_sort_option.dart';
import 'package:fii_app/modules/reit_list/presentation/stores/reit_list_settings_store.dart';
import 'package:fii_app/modules/reit_list/presentation/stores/reit_list_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'reit_card_component.dart';
import 'reit_shimmer_card_component.dart';

class ReitListComponent extends StatelessWidget {
  final ReitListSortOptionType sortType;
  final String sortLabel;

  final reitListStore = GetIt.I.get<ReitListStore>();
  final reitListSettingsStore = GetIt.I.get<ReitListSettingsStore>();

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
                final loadingCardsLimit = reitListSettingsStore.limit > 5
                    ? 5
                    : reitListSettingsStore.limit;

                return Column(
                  children: List.filled(
                    loadingCardsLimit,
                    const ReitShimmerCardComponent(),
                  ),
                );
              }

              if (reitListStore.hasError) {
                return Center(
                  child: Text(reitListStore.errorMessage),
                );
              }

              final reits = reitListStore
                  .getReitsSortedBy(sortType)
                  .take(reitListSettingsStore.limit);

              return Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: reits.length,
                    itemBuilder: (_, int index) {
                      final reit = reits.elementAt(index);

                      return ReitCardComponent(
                        reit: reit,
                        sortType: sortType,
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          overlayColor: MaterialStateColor.resolveWith(
                            (states) => AppColors.lightgrey.withOpacity(0.5),
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "ver lista completa",
                              style: AppTextStyles.button,
                            ),
                            Icon(
                              Icons.chevron_right,
                              size: 20,
                              color: AppTextStyles.button.color,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
