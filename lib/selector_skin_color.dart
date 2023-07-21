import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/langue_choose.dart';

class SkinColorSelector extends StatefulWidget {
  const SkinColorSelector({super.key, required this.onSelectColor});
  final Function(String) onSelectColor;

  @override
  State<SkinColorSelector> createState() => _SkinColorSelectorState();
}

class _SkinColorSelectorState extends State<SkinColorSelector> {
  int selectedColor = 0;
  late List<String> listEthnicity;

  @override
  Widget build(BuildContext context) {
    listEthnicity = context.watch<LangueChoose>().isEnglish ? ['White', 'Black', 'Hispanic', 'Other'] : ['Blanc', 'Noir', 'Hispanique', 'Autre'];

    return DropdownButtonFormField(
      value: listEthnicity[selectedColor],
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20),
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
      items: listEthnicity.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            selectedColor = listEthnicity.indexOf(newValue);
          });
          widget.onSelectColor(newValue);
        }
      },
    );
  }
}
