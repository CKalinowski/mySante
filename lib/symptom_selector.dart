import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class SymptomSelector extends StatefulWidget {
  final void Function(String symptom, int value)? onSelected;

  const SymptomSelector({Key? key, this.onSelected}) : super(key: key);

  @override
  _SymptomSelectorState createState() => _SymptomSelectorState();
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
        DropdownButtonFormField(
          // ajout padding pour éviter que le texte ne soit coupé
          padding: EdgeInsets.only(right: 10, top: 20),
          items: _symptoms
              .map(
                (symptom) => DropdownMenuItem(
                  value: symptom,
                  child: Text(symptom),
                ),
              )
              .toList(),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            setState(() {
              _selectedSymptom = value.toString();
            });
          },
        ),
        SizedBox(height: 10),
        Text(
          'Le niveau entre 1 et 10 :',
          style: GoogleFonts.lato(
            fontSize: 20,
            color: const Color(0xff707070),
          ),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 10),
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
                  style: TextStyle(fontSize: 20),
                ),
              );
            },
            appearance: CircularSliderAppearance(
              // reduction de la taille du cercle
              size: 100,
              customColors: CustomSliderColors(
                progressBarColors: [Color(0xff16679a), Color(0xff16679a)],
                trackColor: Color(0xff16679a).withOpacity(0.2),
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
        SizedBox(height: 10),
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
          child: Text('Valider'),
        ),
      ],
    );
  }
}
