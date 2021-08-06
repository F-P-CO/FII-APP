import 'package:fii_app/modules/home/stores/reit_list_store.dart';
import 'package:fii_app/shared/hooks/use_navigator_service_hook.dart';
import 'package:fii_app/modules/home/models/reit_list_sort_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class OrderingBottomSheetComponent extends StatelessWidget {
  final reitListStore = GetIt.I.get<ReitListStore>();

  OrderingBottomSheetComponent({
    Key? key,
  }) : super(key: key);

  void _changeOption(ReitListSortOption newOption) {
    useNavigatorService().pop();
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
              onTap: () => _changeOption(option),
              trailing: Observer(
                builder: (_) {
                  return Radio(
                    value: option,
                    groupValue: reitListStore.currentSortOption,
                    onChanged: (ReitListSortOption? option) {
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
