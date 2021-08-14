import 'package:fii_app/core/presentation/components/header_app_bar_component.dart';
import 'package:fii_app/core/presentation/themes/app_colors.dart';
import 'package:fii_app/modules/reit_list/presentation/components/reit_list_component.dart';
import 'package:fii_app/modules/reit_list/presentation/components/sort_option_picker_component.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../stores/reit_list_store.dart';

class ReitListPage extends StatelessWidget {
  final reitListStore = GetIt.I.get<ReitListStore>();

  ReitListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: HeaderAppBarComponent(
        title: 'Fundos Imobiliários',
        buttonLabel: 'Ver todos',
        buttonOnPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SortOptionPickerComponent(),
              const SizedBox(height: 8),
              ReitListComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
