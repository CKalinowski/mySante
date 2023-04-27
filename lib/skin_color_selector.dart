import 'package:flutter/material.dart';

class SkinColorSelector extends StatefulWidget {
  final Function(String) onSelectColor;

  SkinColorSelector({required this.onSelectColor});

  @override
  _SkinColorSelectorState createState() => _SkinColorSelectorState();
}

class _SkinColorSelectorState extends State<SkinColorSelector> {
  String selectedColor = 'Caucasien';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: selectedColor,
      padding: EdgeInsets.only(top: 10, bottom: 10, right: 20),
      decoration: InputDecoration(
        labelText: 'Couleur de peau',
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
