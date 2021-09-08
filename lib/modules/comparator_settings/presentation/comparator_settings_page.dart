import 'package:fii_app/core/navigation/navigator_service.dart';
import 'package:fii_app/core/presentation/components/page_app_bar_component.dart';
import 'package:fii_app/core/presentation/themes/app_colors.dart';
import 'package:fii_app/core/presentation/stores/comparator_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'components/range_slider_filter_component.dart';

class ComparatorSettingsPage extends StatelessWidget {
  final navigatorService = GetIt.I.get<NavigatorService>().currentState!;
  final comparatorStore = GetIt.I.get<ComparatorStore>();

  ComparatorSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: PageAppBarComponent(
        title: "Filtros",
        closeOnPressed: () => navigatorService.pop(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Observer(
                builder: (_) {
                  final min = comparatorStore.minAssetsAmount.toDouble();
                  final max = comparatorStore.maxAssetsAmount.toDouble();
                  const filter = Filter.assetsAmount;
                  final disable = !comparatorStore.isFilterEnabled(filter);

                  return RangeSliderFilterComponent(
                    title: "Número de ativos",
                    min: min,
                    max: max,
                    disable: disable,
                    currentRange: comparatorStore.assetsAmountRange,
                    onChange: (lower, upper) =>
                        comparatorStore.assetsAmountRange = [lower, upper],
                    onToggle: () => comparatorStore.toggleFilter(filter),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
