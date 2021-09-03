import 'package:fii_app/core/presentation/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputComponent extends StatelessWidget {
  final String labelText;
  final String? prefix;
  final String? suffix;
  final TextInputType? keyboardType;
  final int? maxLength;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  const InputComponent({
    Key? key,
    required this.labelText,
    this.prefix,
    this.suffix,
    this.keyboardType,
    this.maxLength,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLength: maxLength,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      decoration: InputDecoration(
        labelText: labelText,
        counterText: "",
        labelStyle: AppTextStyles.primaryFont,
        prefix: prefix != null
            ? Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(prefix!),
              )
            : null,
        suffix: suffix != null
            ? Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(suffix!),
              )
            : null,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 4.0,
          horizontal: 10.0,
        ),
      ),
      onChanged: onChanged,
    );
  }
}
