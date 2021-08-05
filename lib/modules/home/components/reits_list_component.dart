import 'package:fii_app/modules/home/stores/reit_list_store.dart';
import 'package:fii_app/modules/home/components/ordering_bottom_sheet_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'reit_card_component.dart';

class ReitsListComponent extends StatefulWidget {
  const ReitsListComponent({Key? key}) : super(key: key);

  @override
  _ReitsListComponentState createState() => _ReitsListComponentState();
}

class _ReitsListComponentState extends State<ReitsListComponent> {
  final reitListStore = GetIt.I.get<ReitListStore>();

  @override
  void initState() {
    super.initState();
  }

  void _showOrderingBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (_) => OrderingBottomSheetComponent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: reitListStore.fetchAll,
                  child: const Text(
                    'Listar',
                  ),
                ),
                ElevatedButton(
                  onPressed: _showOrderingBottomSheet,
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

              return Column(
                children: reitListStore.sortedReits
                    .map((reit) => ReitCardComponent(reit: reit))
                    .toList(),
              );
            },
          )
        ],
      ),
    );
  }
}
