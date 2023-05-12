import 'package:flutter/material.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({Key? key, this.onSelected}) : super(key: key);
  final void Function(String)? onSelected;

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String _selectedGender = '';

  void _handleGenderSelected(String gender) {
    setState(() {
      _selectedGender = gender;
    });
    widget.onSelected?.call(_selectedGender);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () => _handleGenderSelected('male'),
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: _selectedGender == 'male'
                  ? Colors.blue[300]
                  : Colors.grey[300],
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(Icons.male, size: 40),
          ),
        ),
        GestureDetector(
          onTap: () => _handleGenderSelected('female'),
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: _selectedGender == 'female'
                  ? Colors.pink[300]
                  : Colors.grey[300],
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(Icons.female, size: 40),
          ),
        ),
      ],
    );
  }
}
