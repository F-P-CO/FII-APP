import 'package:fii_app/core/navigation/navigator_service.dart';
import 'package:fii_app/core/presentation/components/page_app_bar_component.dart';
import 'package:fii_app/core/presentation/themes/app_colors.dart';
import 'package:fii_app/core/presentation/stores/comparator_store.dart';
import 'package:fii_app/core/presentation/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'components/range_input_filter_component.dart';
import 'components/range_slider_filter_component.dart';

class ComparatorSettingsPage extends StatelessWidget {
  final navigatorService = GetIt.I.get<NavigatorService>().currentState!;
  final comparatorStore = GetIt.I.get<ComparatorStore>();

  ComparatorSettingsPage({Key? key}) : super(key: key);

  static const Map<ReitFilter, String> filtersTitle = {
    ReitFilter.dividendYield: "Dividend Yield",
    ReitFilter.assetsAmount: "Número de ativos",
  };

  void closePage() => navigatorService.pop();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        appBar: PageAppBarComponent(
          title: "Filtros",
          closeOnPressed: closePage,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Observer(
                  builder: (_) {
                    return TextButton(
                      onPressed: closePage,
                      style: ButtonStyle(
                        overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.black.withOpacity(0.1),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "${comparatorStore.currentReits.length}",
                            style: AppTextStyles.largeBoldHeader.copyWith(
                              color: AppColors.blackGrey,
                            ),
                          ),
                          Text(
                            "fundos correspondentes",
                            style: AppTextStyles.smallHeader.copyWith(
                              color: AppColors.blackGrey,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 12.0),
                Observer(
                  builder: (_) {
                    const filter = ReitFilter.dividendYield;
                    final disable = !comparatorStore.isFilterEnabled(filter);

                    return RangeInputFilterComponent(
                      title: filtersTitle[filter]!,
                      currentRange: comparatorStore.dividendYieldRange,
                      disable: disable,
                      suffix: "%",
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      onChange: (min, max) =>
                          comparatorStore.dividendYieldRange = [min, max],
                      onToggle: () => comparatorStore.toggleFilter(filter),
                    );
                  },
                ),
                Observer(
                  builder: (_) {
                    final min = comparatorStore.minAssetsAmount.toDouble();
                    final max = comparatorStore.maxAssetsAmount.toDouble();
                    const filter = ReitFilter.assetsAmount;
                    final disable = !comparatorStore.isFilterEnabled(filter);

                    return RangeSliderFilterComponent(
                      title: filtersTitle[filter]!,
                      min: min,
                      max: max,
                      disable: disable,
                      currentRange: comparatorStore.assetsAmountRange,
                      onChange: (min, max) =>
                          comparatorStore.assetsAmountRange = [min, max],
                      onToggle: () => comparatorStore.toggleFilter(filter),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
