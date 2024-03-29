import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import 'api.dart';
import 'main.dart';
import 'model/langue_choose.dart';
import 'model/symptom.dart';

class SymptomSelector extends StatefulWidget {
  const SymptomSelector(
      {Key? key, this.onSelected, required this.symptomSelected})
      : super(key: key);
  final void Function(Symptom symptom, int value)? onSelected;

  final List<Symptom> symptomSelected;
  @override
  State<SymptomSelector> createState() => _SymptomSelectorState();
}

class _SymptomSelectorState extends State<SymptomSelector> {
  Symptom? _selectedSymptom;
  int _selectedValue = 1;
  String textSymptomes = 'Symptômes';
  String textNiveau = 'Intensité du symptôme entre 1 et 10';
  String textValider = 'Valider';
  String textRechercher = 'Rechercher ...';
  String textVotreSymptome = "Votre symptôme ...";
  String textNiveauSymptome = "Niveau";
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
        FutureBuilder(
            future: translator.translate(textSymptomes,
                from: 'fr',
                to: context.watch<LangueChoose>().isEnglish ? 'en' : 'fr'),
            builder: (context, snapshot) {
              return Text(
                snapshot.hasData ? snapshot.data.toString() : textSymptomes,
                style: GoogleFonts.lato(
                  fontSize: 20,
                  color: const Color(0xff707070),
                ),
                textAlign: TextAlign.left,
              );
            }),
        Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Theme.of(context).hintColor,
            ),
          ),
          child: FutureBuilder(
            future: Api.getSymptoms(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final List<Symptom> symptoms = snapshot.data as List<Symptom>;
                if (context.watch<LangueChoose>().isEnglish) {
                  symptoms.sort((a, b) => a.nomEn.compareTo(b.nomEn));
                } else {
                  symptoms.sort((a, b) => a.nomFr.compareTo(b.nomFr));
                }
                return DropdownButtonHideUnderline(
                  child: DropdownButton2<int?>(
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      isExpanded: true,
                      hint: FutureBuilder(
                          future: translator.translate(textRechercher,
                              from: 'fr',
                              to: context.watch<LangueChoose>().isEnglish
                                  ? 'en'
                                  : 'fr'),
                          builder: (context, snapshot) {
                            return Text(
                              snapshot.hasData
                                  ? snapshot.data.toString()
                                  : textRechercher,
                              style: GoogleFonts.lato(
                                color: Theme.of(context).hintColor,
                              ),
                              textAlign: TextAlign.left,
                            );
                          }),
                      items: symptoms
                          .where((element) =>
                              !widget.symptomSelected.contains(element))
                          .map((symptom) => DropdownMenuItem(
                                value: symptom.id,
                                child: Text(
                                  context.watch<LangueChoose>().isEnglish
                                      ? symptom.nomEn
                                      : symptom.nomFr,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: _selectedSymptom?.id,
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          _selectedSymptom = symptoms
                              .firstWhere((element) => element.id == value);
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
                          child: FutureBuilder(
                              future: translator.translate(textVotreSymptome,
                                  from: 'fr',
                                  to: context.watch<LangueChoose>().isEnglish
                                      ? 'en'
                                      : 'fr'),
                              builder: (context, snapshot) {
                                return TextFormField(
                                  expands: true,
                                  maxLines: null,
                                  controller: textEditingController,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 8,
                                    ),
                                    hintText: snapshot.hasData
                                        ? snapshot.data.toString()
                                        : textVotreSymptome,
                                    hintStyle: const TextStyle(fontSize: 12),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                );
                              }),
                        ),
                        searchMatchFn: (item, searchValue) {
                          Symptom symptomLangue = symptoms.firstWhere(
                              (element) => element.id == item.value);
                          return (context.read<LangueChoose>().isEnglish
                                  ? symptomLangue.nomEn
                                  : symptomLangue.nomFr)
                              .toLowerCase()
                              .contains(searchValue.toLowerCase());
                        },
                      ),
                      //This to clear the search value when you close the menu
                      onMenuStateChange: (isOpen) {
                        if (!isOpen) {
                          textEditingController.clear();
                        }
                      }),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
        const SizedBox(height: 10),
        FutureBuilder(
            future: translator.translate(textNiveau,
                from: 'fr',
                to: context.watch<LangueChoose>().isEnglish ? 'en' : 'fr'),
            builder: (context, snapshot) {
              return Text(
                snapshot.hasData ? snapshot.data.toString() : textNiveau,
                style: GoogleFonts.lato(
                  fontSize: 18,
                  color: const Color(0xff707070),
                ),
                textAlign: TextAlign.left,
              );
            }),
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
            if (_selectedSymptom != null) {
              widget.onSelected?.call(_selectedSymptom!, _selectedValue);
              _selectedSymptom = null;
              _selectedValue = 1;
            }
          },
          child: FutureBuilder(
              future: translator.translate(textValider,
                  from: 'fr',
                  to: context.watch<LangueChoose>().isEnglish ? 'en' : 'fr'),
              builder: (context, snapshot) {
                return Text(
                  snapshot.hasData ? snapshot.data.toString() : textValider,
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    color: const Color(0xffffffff),
                  ),
                  textAlign: TextAlign.center,
                );
              }),
        ),
      ],
    );
  }
}
