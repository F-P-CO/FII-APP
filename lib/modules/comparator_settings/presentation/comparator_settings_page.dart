import 'package:fii_app/core/navigation/navigator_service.dart';
import 'package:fii_app/core/presentation/components/page_app_bar_component.dart';
import 'package:fii_app/core/presentation/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'components/range_slider_filter_component.dart';

class ComparatorSettingsPage extends StatelessWidget {
  final navigatorService = GetIt.I.get<NavigatorService>().currentState!;

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
            children: const [
              RangeSliderFilterComponent(
                title: "Dividend Yield",
                min: 0,
                max: 20,
                currentRange: RangeValues(0, 15),
              ),
              RangeSliderFilterComponent(
                title: "Número de ativos",
                disable: true,
                min: 0,
                max: 20,
                currentRange: RangeValues(0, 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
