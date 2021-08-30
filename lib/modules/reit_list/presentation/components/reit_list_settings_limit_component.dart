import 'package:fii_app/core/presentation/components/number_slider_component.dart';
import 'package:fii_app/core/presentation/helpers/debouncer.dart';
import 'package:fii_app/core/presentation/themes/app_text_styles.dart';
import 'package:fii_app/modules/reit_list/presentation/stores/reit_list_settings_store.dart';
import 'package:fii_app/core/presentation/stores/reit_list_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ReitListSettingsLimitComponent extends StatefulWidget {
  const ReitListSettingsLimitComponent({Key? key}) : super(key: key);

  @override
  _ReitListSettingsLimitComponentState createState() =>
      _ReitListSettingsLimitComponentState();
}

class _ReitListSettingsLimitComponentState
    extends State<ReitListSettingsLimitComponent> {
  final reitListStore = GetIt.I.get<ReitListStore>();
  final reitListSettingsStore = GetIt.I.get<ReitListSettingsStore>();

  final _debouncer = Debouncer(delay: const Duration(milliseconds: 300));
  late double _currentNumber;

  @override
  void initState() {
    _currentNumber = reitListSettingsStore.limit.toDouble();
    super.initState();
  }

  @override
  void dispose() {
    _debouncer.dispose();
    super.dispose();
  }

  void _changeLimit(double newLimit) {
    _debouncer(() {
      final int limit = newLimit.round();
      reitListSettingsStore.changeLimit(limit);
    });

    setState(() {
      _currentNumber = newLimit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Quantidade de fundos a exibir",
              style: AppTextStyles.smallHeader,
            ),
            Text(
              _currentNumber.round().toString(),
              style: AppTextStyles.smallHeader.copyWith(
                fontWeight: AppTextStyles.primaryFontWeightBold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        NumberSliderComponent(
          initialValue: reitListSettingsStore.limit.toDouble(),
          min: 1,
          max: reitListStore.totalReits.toDouble(),
          onChanged: _changeLimit,
        )
      ],
    );
  }
}
