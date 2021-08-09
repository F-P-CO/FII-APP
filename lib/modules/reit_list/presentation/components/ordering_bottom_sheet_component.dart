import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:fii_app/core/navigation/navigator_service.dart';

import '../stores/reit_list_store.dart';

class OrderingBottomSheetComponent extends StatelessWidget {
  final reitListStore = GetIt.I.get<ReitListStore>();

  OrderingBottomSheetComponent({
    Key? key,
  }) : super(key: key);

  void _changeOption(ReitListSortOptionType newOption) {
    GetIt.I.get<NavigatorService>().currentState!.pop();
    reitListStore.currentSortOption = newOption;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: reitListStore.sortOptions
          .map(
            (option) => ListTile(
              title: Text(option.label),
              onTap: () => _changeOption(option.type),
              trailing: Observer(
                builder: (_) {
                  return Radio(
                    value: option.type,
                    groupValue: reitListStore.currentSortOption,
                    onChanged: (ReitListSortOptionType? option) {
                      if (option != null) {
                        _changeOption(option);
                      }
                    },
                  );
                },
              ),
            ),
          )
          .toList(),
    );
  }
}
