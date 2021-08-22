import 'package:easy_debounce/easy_debounce.dart';
import 'package:fii_app/core/presentation/components/bottom_sheet_component.dart';
import 'package:fii_app/core/presentation/components/filter_chip_component.dart';
import 'package:fii_app/core/presentation/components/number_slider_component.dart';
import 'package:fii_app/core/presentation/themes/app_text_styles.dart';
import 'package:fii_app/modules/reit_list/presentation/stores/reit_list_settings_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../stores/reit_list_store.dart';

class ReitListSettingsBottomSheetComponent extends StatelessWidget {
  final reitListStore = GetIt.I.get<ReitListStore>();
  final reitListSettingsStore = GetIt.I.get<ReitListSettingsStore>();

  ReitListSettingsBottomSheetComponent({
    Key? key,
  }) : super(key: key);

  void _changeLimit(double newLimit) {
    final int limit = newLimit.round();

    EasyDebounce.debounce(
      'reit-list-settings-change-limit',
      const Duration(milliseconds: 500),
      () => reitListSettingsStore.changeLimit(limit),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetComponent(
      title: "Configurar lista de fundos",
      children: [
        Text(
          "Listas a exibir",
          style: AppTextStyles.smallHeader,
        ),
        const SizedBox(height: 10.0),
        Observer(
          builder: (_) {
            return Wrap(
              spacing: 5,
              runSpacing: 10,
              children: reitListStore.sortOptions
                  .map(
                    (option) => FilterChipComponent(
                      label: option.label,
                      active: reitListSettingsStore.isEnabled(option.type),
                      onTap: () =>
                          reitListSettingsStore.toggleList(option.type),
                    ),
                  )
                  .toList(),
            );
          },
        ),
        const SizedBox(height: 32.0),
        Text(
          "Quantidade de fundos a exibir",
          style: AppTextStyles.smallHeader,
        ),
        const SizedBox(height: 10.0),
        Observer(
          builder: (_) => NumberSliderComponent(
            initialValue: reitListSettingsStore.limit.toDouble(),
            min: 1,
            max: reitListStore.totalReits.toDouble(),
            onChanged: _changeLimit,
          ),
        ),
      ],
    );
  }
}
