import 'package:fii_app/core/presentation/components/bottom_sheet_component.dart';
import 'package:fii_app/core/presentation/components/filter_chip_component.dart';
import 'package:fii_app/core/presentation/components/number_slider_component.dart';
import 'package:fii_app/core/presentation/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../stores/reit_list_store.dart';

class ReitListSettingsBottomSheetComponent extends StatelessWidget {
  final reitListStore = GetIt.I.get<ReitListStore>();

  ReitListSettingsBottomSheetComponent({
    Key? key,
  }) : super(key: key);

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
        Wrap(
          spacing: 5,
          runSpacing: 10,
          children: [
            FilterChipComponent(
              label: "Patrimônio Liquído",
              active: true,
              onTap: () {},
            ),
            FilterChipComponent(
              label: "D/Y atual",
              onTap: () {},
            ),
            FilterChipComponent(
              label: "Preço atual",
              onTap: () {},
            ),
            FilterChipComponent(
              label: "Quantidade de Ativos",
              onTap: () {},
            ),
            FilterChipComponent(
              label: "Liquidez Diária",
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(height: 32.0),
        Text(
          "Quantidade de fundos a exibir",
          style: AppTextStyles.smallHeader,
        ),
        const SizedBox(height: 10.0),
        NumberSliderComponent(
          initialValue: 1,
          min: 1,
          max: 250,
          onChanged: (double value) {},
        ),
      ],
    );
  }
}
