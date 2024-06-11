import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumericTextfield extends StatelessWidget {
  final String? labelText;
  final ValueChanged<String> onChanged;
  const NumericTextfield({super.key, this.labelText, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      onChanged: onChanged,
      textAlign: TextAlign.center,
      style: theme.textTheme.displayMedium,
      decoration: InputDecoration(
          labelText: labelText,
          hintText: "10.00€",
          border: const OutlineInputBorder(),
          floatingLabelAlignment: FloatingLabelAlignment.center),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\,?\d{0,2}'))
      ],
    );
  }
}
