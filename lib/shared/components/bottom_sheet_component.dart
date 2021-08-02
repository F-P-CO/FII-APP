import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ModalSheetOption {
  final String label;
  final void Function(String?) onPressed;
  final String id;

  ModalSheetOption(
      {required this.label, required this.onPressed, required this.id});
}

class ModalBottomSheetConfiguration {
  final BuildContext context;
  final List<ModalSheetOption> options;
  final String currentValue;

  ModalBottomSheetConfiguration(
      {required this.context,
      required this.options,
      required this.currentValue});
}

Future showModalSheet({required ModalBottomSheetConfiguration config}) {
  return showModalBottomSheet(
      context: config.context,
      builder: (context) {
        String? currentValue = config.currentValue;
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: config.options.map((option) {
                return ListTile(
                  title: Text(option.label),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  trailing: Radio(
                    value: option.id,
                    onChanged: (String? newValue) {
                      option.onPressed(newValue);
                      setState(() {
                        currentValue = newValue;
                      });
                      Navigator.pop(context);
                    },
                    groupValue: currentValue,
                  ),
                );
              }).toList(),
            );
          },
        );
      });
}
