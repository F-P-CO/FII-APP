import 'package:fii_app/shared/components/ordering_bottom_sheet_component.dart';
import 'package:fii_app/shared/stores/reit_store.dart';
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
  final reitStore = GetIt.I.get<ReitStore>();

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
                  onPressed: reitStore.loadReitsList,
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
              if (reitStore.isListLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              final reits = reitStore.currentReitList;

              return Column(
                children: [
                  Text(reitStore.getCurrentSortOption.toString()),
                  Column(
                    children: reits
                        .map((reit) => ReitCardComponent(reit: reit))
                        .toList(),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
