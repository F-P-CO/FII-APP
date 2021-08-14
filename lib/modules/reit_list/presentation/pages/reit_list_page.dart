import 'package:fii_app/core/presentation/components/header_app_bar_component.dart';
import 'package:fii_app/core/presentation/themes/app_colors.dart';
import 'package:fii_app/core/presentation/themes/no_scroll_glow_behavior.dart';
import 'package:fii_app/modules/reit_list/presentation/components/reit_list_component.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../stores/reit_list_store.dart';

class ReitListPage extends StatelessWidget {
  final reitListStore = GetIt.I.get<ReitListStore>();

  ReitListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: HeaderAppBarComponent(
        title: 'Fundos Imobiliários',
        settingsOnPressed: () {},
        favoritesOnPressed: () {},
        searchOnPressed: () {},
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.scaffoldBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: ScrollConfiguration(
          behavior: NoScrollGlowBehavior(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: reitListStore.sortOptions
                    .map(
                      (option) => ReitListComponent(
                        sortOption: option,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
