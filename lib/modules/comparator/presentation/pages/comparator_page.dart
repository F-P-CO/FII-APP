import 'package:fii_app/core/navigation/navigator_service.dart';
import 'package:fii_app/core/presentation/components/filter_chip_component.dart';
import 'package:fii_app/core/presentation/components/header_app_bar_component.dart';
import 'package:fii_app/core/presentation/stores/reit_list_store.dart';
import 'package:fii_app/core/presentation/themes/app_colors.dart';
import 'package:fii_app/core/presentation/themes/app_text_styles.dart';
import 'package:fii_app/core/presentation/themes/no_scroll_glow_behavior.dart';
import 'package:fii_app/modules/comparator/presentation/components/comparator_table_component.dart';
import 'package:fii_app/core/presentation/stores/comparator_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class ComparatorPage extends StatelessWidget {
  final currencyFormatter = GetIt.I.get<NumberFormat>();
  final navigatorService = GetIt.I.get<NavigatorService>().currentState!;
  final reitListStore = GetIt.I.get<ReitListStore>();
  final comparatorStore = GetIt.I.get<ComparatorStore>();

  ComparatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: HeaderAppBarComponent(
        title: 'Comparador',
        settingsOnPressed: () =>
            navigatorService.pushNamed('/comparator-settings'),
        searchOnChange: (String value) => comparatorStore.searchText = value,
      ),
      body: ScrollConfiguration(
        behavior: NoScrollGlowBehavior(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Colunas a exibir",
                style: AppTextStyles.header,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Observer(
                builder: (_) => Row(
                  children: comparatorStore.tableColumns
                      .map(
                        (column) => Padding(
                          padding: EdgeInsets.only(
                            left: column == comparatorStore.tableColumns.first
                                ? 16.0
                                : 0,
                            right: column == comparatorStore.tableColumns.last
                                ? 16.0
                                : 8.0,
                          ),
                          child: FilterChipComponent(
                            label: column.label,
                            active: comparatorStore.isColumnEnabled(column),
                            onTap: () => comparatorStore.toggleColumn(column),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: Observer(
                builder: (_) {
                  if (reitListStore.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (comparatorStore.currentReits.isEmpty) {
                    return const Center(
                      child: Text(
                          "Nenhum fundo encontrado com os filtros atuais."),
                    );
                  }

                  return ComparatorTableComponent(
                    reits: comparatorStore.currentReits,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
