import 'package:flutter/material.dart';

class SkinColorSelector extends StatefulWidget {
  const SkinColorSelector({super.key, required this.onSelectColor});
  final Function(String) onSelectColor;

  @override
  State<SkinColorSelector> createState() => _SkinColorSelectorState();
}

class _SkinColorSelectorState extends State<SkinColorSelector> {
  String selectedColor = 'Caucasien';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: selectedColor,
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20),
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
      items: <String>[
        'Caucasien',
        'Asiatique',
        'Métis',
        'Africain',
        'Afro-Américain',
        'Latino-Américain',
        'Indien'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            selectedColor = newValue;
          });
          widget.onSelectColor(newValue);
        }
      },
    );
  }
}
