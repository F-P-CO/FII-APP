import 'package:fii_app/core/presentation/components/header_app_bar.dart';
import 'package:fii_app/core/presentation/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../components/reit_card_component.dart';
import '../components/sort_bottom_sheet_component.dart';
import '../stores/reit_list_store.dart';

class ReitListPage extends StatelessWidget {
  final reitListStore = GetIt.I.get<ReitListStore>();

  ReitListPage({Key? key}) : super(key: key);

  void _showOrderingBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => SortBottomSheetComponent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: HeaderAppBar(
        title: 'Fundos Imobiliários',
        buttonLabel: 'Ver todos',
        buttonOnPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: reitListStore.loadReitList,
                      child: const Text(
                        'Listar',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _showOrderingBottomSheet(context),
                      child: const Text(
                        'Ordenar',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Observer(
                builder: (_) {
                  if (reitListStore.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (reitListStore.hasError) {
                    return Center(
                      child: Text(reitListStore.errorMessage),
                    );
                  }

                  return Column(
                    children: reitListStore.sortedReits
                        .map((reit) => ReitCardComponent(reit: reit))
                        .toList(),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
