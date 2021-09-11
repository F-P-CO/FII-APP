import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/domain/entities/reit_column.dart';
import '../../../../core/presentation/models/reit_filter.dart';
import '../../../../core/presentation/stores/comparator_store.dart';
import 'range_input_filter_component.dart';
import 'range_slider_filter_component.dart';

class FilterListComponent extends StatelessWidget {
  final comparatorStore = GetIt.I.get<ComparatorStore>();

  late final List<ReitSettingsFilter> filters = [
    ReitSettingsInputFilter(
      column: const ReitColumn(type: ReitColumnType.currentDividendYield),
      suffix: '%',
      keyboardType: TextInputType.number,
      maxLength: 6,
      disable: () => !comparatorStore.isFilterEnabled(
        const ReitColumn(
          type: ReitColumnType.currentDividendYield,
        ),
      ),
      currentRange: () => comparatorStore.dividendYieldRange,
      onChange: (min, max) => comparatorStore.dividendYieldRange = [min, max],
      onToggle: () => comparatorStore.toggleFilter(
        const ReitColumn(
          type: ReitColumnType.currentDividendYield,
        ),
      ),
    ),
    ReitSettingsSliderFilter(
      column: const ReitColumn(type: ReitColumnType.assetsAmount),
      min: () => comparatorStore.minAssetsAmount.toDouble(),
      max: () => comparatorStore.maxAssetsAmount.toDouble(),
      disable: () => !comparatorStore.isFilterEnabled(
        const ReitColumn(
          type: ReitColumnType.assetsAmount,
        ),
      ),
      currentRange: () => comparatorStore.assetsAmountRange,
      onChange: (min, max) => comparatorStore.assetsAmountRange = [min, max],
      onToggle: () => comparatorStore.toggleFilter(
        const ReitColumn(
          type: ReitColumnType.assetsAmount,
        ),
      ),
    ),
    ReitSettingsSliderFilter(
      column: const ReitColumn(type: ReitColumnType.vacancy),
      min: () => comparatorStore.minVacancy.toDouble(),
      max: () => comparatorStore.maxVacancy.toDouble(),
      disable: () => !comparatorStore.isFilterEnabled(
        const ReitColumn(
          type: ReitColumnType.vacancy,
        ),
      ),
      currentRange: () => comparatorStore.vacancyRange,
      onChange: (min, max) => comparatorStore.vacancyRange = [min, max],
      onToggle: () => comparatorStore.toggleFilter(
        const ReitColumn(
          type: ReitColumnType.vacancy,
        ),
      ),
    ),
  ];

  FilterListComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: filters
          .map(
            (filter) => Observer(
              builder: (_) {
                if (filter is ReitSettingsInputFilter) {
                  return RangeInputFilterComponent(
                    title: filter.column.label,
                    suffix: filter.suffix,
                    keyboardType: filter.keyboardType,
                    maxLength: filter.maxLength,
                    disable: filter.disable(),
                    currentRange: filter.currentRange(),
                    onChange: filter.onChange,
                    onToggle: filter.onToggle,
                  );
                }

                if (filter is ReitSettingsSliderFilter) {
                  return RangeSliderFilterComponent(
                    title: filter.column.label,
                    min: filter.min(),
                    max: filter.max(),
                    disable: filter.disable(),
                    currentRange: filter.currentRange(),
                    onChange: filter.onChange,
                    onToggle: filter.onToggle,
                  );
                }

                return Container();
              },
            ),
          )
          .toList(),
    );
  }
}
