import 'package:fii_app/core/navigation/navigator_service.dart';
import 'package:fii_app/core/presentation/components/header_app_bar_component.dart';
import 'package:fii_app/core/presentation/stores/reit_list_store.dart';
import 'package:fii_app/core/presentation/themes/app_colors.dart';
import 'package:fii_app/core/presentation/themes/no_scroll_glow_behavior.dart';
import 'package:fii_app/modules/comparator/presentation/components/comparator_table_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class ComparatorPage extends StatelessWidget {
  final currencyFormatter = GetIt.I.get<NumberFormat>();
  final navigatorService = GetIt.I.get<NavigatorService>().currentState!;
  final reitListStore = GetIt.I.get<ReitListStore>();

  ComparatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: HeaderAppBarComponent(
        title: 'Comparador',
        settingsOnPressed: () =>
            navigatorService.pushNamed('/comparator-settings'),
        searchOnPressed: () {},
      ),
      body: ScrollConfiguration(
        behavior: NoScrollGlowBehavior(),
        child: Observer(
          builder: (_) {
            if (reitListStore.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return ComparatorTableComponent(
              reits: reitListStore.reits,
            );
          },
        ),
      ),
    );
  }
}
