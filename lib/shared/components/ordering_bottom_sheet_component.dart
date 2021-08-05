import 'package:fii_app/shared/hooks/use_navigator_service_hook.dart';
import 'package:fii_app/shared/stores/reit_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class OrderingBottomSheetComponent extends StatelessWidget {
  final reitStore = GetIt.I.get<ReitStore>();

  OrderingBottomSheetComponent({
    Key? key,
  }) : super(key: key);

  void _changeOption(ReitListSortOption newOption) {
    useNavigatorService().pop();
    reitStore.currentSortOption = newOption;
  }

  @override
  Widget build(BuildContext context) {
    const options = ReitListSortOption.values;
    return ListView.separated(
      shrinkWrap: true,
      itemCount: options.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (_, index) => ListTile(
        title: Text(options[index].toString()),
        onTap: () => _changeOption(options[index]),
        trailing: Observer(builder: (_) {
          return Radio(
            value: options[index],
            groupValue: reitStore.getCurrentSortOption,
            onChanged: (ReitListSortOption? option) {
              if (option != null) {
                _changeOption(option);
              }
            },
          );
        }),
      ),
    );
  }
}
