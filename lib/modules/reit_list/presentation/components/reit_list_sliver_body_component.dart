import 'package:fii_app/modules/reit_list/domain/entities/reit_list_sort_option.dart';
import 'package:fii_app/modules/reit_list/presentation/stores/reit_list_settings_store.dart';
import 'package:fii_app/modules/reit_list/presentation/stores/reit_list_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'reit_card_component.dart';
import 'reit_shimmer_card_component.dart';

class ReitListSliverBodyComponent extends StatelessWidget {
  final reitListStore = GetIt.I.get<ReitListStore>();
  final reitListSettingsStore = GetIt.I.get<ReitListSettingsStore>();

  final ReitListSortOption sortOption;

  ReitListSliverBodyComponent({
    Key? key,
    required this.sortOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: Observer(
        builder: (_) {
          if (reitListStore.isLoading) {
            final loadingCardsLimit = reitListSettingsStore.limit > 5
                ? 5
                : reitListSettingsStore.limit;

            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, __) => const ReitShimmerCardComponent(),
                childCount: loadingCardsLimit,
              ),
            );
          }

          if (reitListStore.hasError) {
            return SliverToBoxAdapter(
              child: Center(
                child: Text(reitListStore.errorMessage),
              ),
            );
          }

          final reits = reitListStore
              .getReitsSortedBy(sortOption.type)
              .take(reitListSettingsStore.limit)
              .toList();

          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return ReitCardComponent(
                  reit: reits.elementAt(index),
                  sortType: sortOption.type,
                );
              },
              childCount: reits.length,
            ),
          );
        },
      ),
    );
  }
}
