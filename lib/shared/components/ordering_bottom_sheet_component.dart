import 'package:fii_app/shared/hooks/use_navigator_service_hook.dart';
import 'package:fii_app/shared/models/modal_bottom_sheet_option.dart';
import 'package:flutter/material.dart';

class OrderingBottomSheetComponent extends StatelessWidget {
  final List<ModalBottomSheetOrderingOption> options;
  final ModalBottomSheetOrderingOption activeOption;
  final Function(ModalBottomSheetOrderingOption) onChange;

  const OrderingBottomSheetComponent({
    Key? key,
    required this.options,
    required this.activeOption,
    required this.onChange,
  }) : super(key: key);

  void _changeOption(ModalBottomSheetOrderingOption newOption) {
    useNavigatorService().pop();
    onChange(newOption);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: options.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (_, index) => ListTile(
        title: Text(options[index].label),
        onTap: () => _changeOption(options[index]),
        trailing: Radio(
          value: options[index],
          groupValue: activeOption,
          onChanged: (ModalBottomSheetOrderingOption? option) {
            if (option != null) {
              _changeOption(option);
            }
          },
        ),
      ),
    );
  }
}
