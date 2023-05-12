import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class SymptomSelector extends StatefulWidget {
  const SymptomSelector({Key? key, this.onSelected}) : super(key: key);
  final void Function(String symptom, int value)? onSelected;

  @override
  State<SymptomSelector> createState() => _SymptomSelectorState();
}

class _SymptomSelectorState extends State<SymptomSelector> {
  String _selectedSymptom = '';
  int _selectedValue = 1;

  final List<String> _symptoms = [
    'Fièvre',
    'Toux',
    'Essoufflement',
    'Fatigue',
    'Douleurs musculaires',
    'Mal de tête',
    'Perte de goût ou d\'odorat',
    'Maux de gorge',
    'Nez bouché ou qui coule',
    'Nausées ou vomissements',
    'Diarrhée',
  ];

  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Symptômes :',
          style: GoogleFonts.lato(
            fontSize: 20,
            color: const Color(0xff707070),
          ),
          textAlign: TextAlign.left,
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Theme.of(context).hintColor,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              isExpanded: true,
              hint: Text(
                'Rechercher ...',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).hintColor,
                ),
              ),
              items: _symptoms
                  .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                  .toList(),
              value: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value as String;
                });
              },
              buttonStyleData: const ButtonStyleData(
                height: 40,
                width: 200,
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
              ),
              dropdownSearchData: DropdownSearchData(
                searchController: textEditingController,
                searchInnerWidgetHeight: 50,
                searchInnerWidget: Container(
                  height: 50,
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 4,
                    right: 8,
                    left: 8,
                  ),
                  child: TextFormField(
                    expands: true,
                    maxLines: null,
                    controller: textEditingController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      hintText: 'Votre symptôme ...',
                      hintStyle: const TextStyle(fontSize: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                searchMatchFn: (item, searchValue) {
                  return (item.value!
                      .toLowerCase()
                      .contains(searchValue.toLowerCase()));
                },
              ),
              //This to clear the search value when you close the menu
              onMenuStateChange: (isOpen) {
                if (!isOpen) {
                  textEditingController.clear();
                }
              },
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Le niveau entre 1 et 10 :',
          style: GoogleFonts.lato(
            fontSize: 20,
            color: const Color(0xff707070),
          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 350,
          child: SleekCircularSlider(
            min: 1,
            max: 10,
            initialValue: _selectedValue.toDouble(),
            onChange: (double value) {
              setState(() {
                _selectedValue = value.toInt();
              });
            },
            innerWidget: (double value) {
              return Center(
                child: Text(
                  '$_selectedValue',
                  style: const TextStyle(fontSize: 20),
                ),
              );
            },
            appearance: CircularSliderAppearance(
              // reduction de la taille du cercle
              size: 100,
              customColors: CustomSliderColors(
                progressBarColors: [
                  const Color(0xff16679a),
                  const Color(0xff16679a)
                ],
                trackColor: const Color(0xff16679a).withOpacity(0.2),
              ),
              customWidths: CustomSliderWidths(progressBarWidth: 10),
              infoProperties: InfoProperties(
                topLabelText: 'Quantité',
                modifier: (double value) {
                  return '${value.toInt()}';
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff16679a),
          ),
          onPressed: () {
            if (_selectedSymptom.isNotEmpty) {
              widget.onSelected?.call(_selectedSymptom, _selectedValue);
              _selectedSymptom = '';
              _selectedValue = 1;
            }
          },
          child: const Text('Valider'),
        ),
      ],
    );
  }
}
