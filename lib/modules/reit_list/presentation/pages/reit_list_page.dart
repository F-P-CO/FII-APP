import 'package:fii_app/core/presentation/components/header_app_bar_component.dart';
import 'package:fii_app/core/presentation/themes/app_colors.dart';
import 'package:fii_app/core/presentation/themes/no_scroll_glow_behavior.dart';
import 'package:fii_app/modules/reit_list/presentation/components/reit_list_component.dart';
import 'package:fii_app/modules/reit_list/presentation/components/reit_list_settings_bottom_sheet_component.dart';
import 'package:fii_app/modules/reit_list/presentation/stores/reit_list_settings_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../stores/reit_list_store.dart';

class ReitListPage extends StatelessWidget {
  final reitListStore = GetIt.I.get<ReitListStore>();
  final reitListSettingsStore = GetIt.I.get<ReitListSettingsStore>();

  ReitListPage({Key? key}) : super(key: key);

  void _openListSettingsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => ReitListSettingsBottomSheetComponent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: HeaderAppBarComponent(
        title: 'Fundos Imobiliários',
        settingsOnPressed: () => _openListSettingsBottomSheet(context),
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
              child: Observer(
                builder: (_) {
                  return Column(
                    children: reitListSettingsStore.enabledLists
                        .map(
                          (option) => ReitListComponent(
                            sortType: option,
                            sortLabel: reitListStore.sortOptions
                                .singleWhere((item) => item.type == option)
                                .label,
                          ),
                        )
                        .toList(),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
