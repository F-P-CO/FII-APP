import 'package:fii_app/modules/reit_list/presentation/stores/reit_list_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'reit_card_component.dart';

class ReitListComponent extends StatelessWidget {
  final reitListStore = GetIt.I.get<ReitListStore>();

  ReitListComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
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

        return Column(
          children: reitListStore.sortedReits
              .map(
                (reit) => ReitCardComponent(
                  reit: reit,
                  currentSortOption: reitListStore.currentSortOption,
                ),
              )
              .toList(),
        );
      },
    );
  }
}
