import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'btn_valider.dart';
import 'header.dart';
import 'model/symptom.dart';
import 'selector_symptom.dart';

class Symptomes extends StatefulWidget {
  const Symptomes(this.selectedColor, this.selectedGender, this.selectedAge,
      {super.key});
  final String selectedColor;
  final String selectedGender;
  final int selectedAge;

  @override
  State<Symptomes> createState() => _SymptomesState();
}

class _SymptomesState extends State<Symptomes> {
  final List<Map<String, dynamic>> _selectedSymptoms = [];

  void _handleSymptomSelected(Symptom symptom, int value) {
    setState(() {
      _selectedSymptoms.add({'symptom': symptom, 'value': value});
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.selectedColor);
    print(widget.selectedGender);
    print(widget.selectedAge);
    return Scaffold(
      appBar: const Header(
        backButton: true,
        title: 'Symptômes',
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Text(
                  'Quels sont vos symptômes ?',
                  style: GoogleFonts.lato(
                    fontSize: 25,
                    color: const Color(0xff707070),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                  width: 350,
                  height: 620,
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: const Color(0xff16679a)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SymptomSelector(
                        onSelected: _handleSymptomSelected,
                        symptomSelected: _selectedSymptoms
                            .map((e) => e['symptom'] as Symptom)
                            .toList(),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Symptômes sélectionnés :',
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          color: const Color(0xff707070),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                          itemCount: _selectedSymptoms.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: RichText(
                                            text: TextSpan(
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: _selectedSymptoms[index]
                                                          ['symptom']
                                                      .nomFr,
                                                  style: GoogleFonts.lato(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                    color:
                                                        const Color(0xff707070),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text:
                                                      ' - niveau : ${_selectedSymptoms[index]['value']}',
                                                  style: GoogleFonts.lato(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        const Color(0xff707070),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _selectedSymptoms.removeAt(index);
                                            });
                                          },
                                          child: const Icon(Icons.close,
                                              color: Colors.red),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        width: 289.0,
                        height: 56.0,
                        margin: const EdgeInsets.only(left: 10, bottom: 10),
                        child: BTNValider(
                          widget.selectedColor,
                          widget.selectedGender,
                          widget.selectedAge,
                          _selectedSymptoms,
                        ),
                      ),
                    ],
                  )),
            ],
          )),
    );
  }
}
