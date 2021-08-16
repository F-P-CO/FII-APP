import 'package:fii_app/core/domain/entities/reit.dart';
import 'package:fii_app/core/presentation/themes/app_colors.dart';
import 'package:fii_app/core/presentation/themes/app_text_styles.dart';
import 'package:fii_app/modules/reit_list/presentation/stores/reit_list_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'reit_card_component.dart';
import 'reit_shimmer_card_component.dart';

class ReitListComponent extends StatelessWidget {
  final ReitListSortOption sortOption;
  final reitListStore = GetIt.I.get<ReitListStore>();

  ReitListComponent({Key? key, required this.sortOption}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "De maior ${sortOption.label.toLowerCase()}",
            style: AppTextStyles.header,
          ),
          const SizedBox(height: 8),
          Observer(
            builder: (_) {
              if (reitListStore.isLoading) {
                return Column(
                  children: List.filled(
                    reitListStore.limit,
                    const ReitShimmerCardComponent(),
                  ),
                );
              }

              if (reitListStore.hasError) {
                return Center(
                  child: Text(reitListStore.errorMessage),
                );
              }

              final reits =
                  reitListStore.getReitsSortedBy(sortOption) as List<Reit>;

              final reitsCards = reits
                  .map(
                    (reit) => ReitCardComponent(
                      reit: reit,
                      sortOption: sortOption,
                    ),
                  )
                  .toList();

              return Column(
                children: [
                  ...reitsCards,
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
