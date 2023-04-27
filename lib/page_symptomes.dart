import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'symptom_selector.dart';

class Symptomes extends StatefulWidget {
  const Symptomes({super.key});

  @override
  State<Symptomes> createState() => _SymptomesState();
}

class _SymptomesState extends State<Symptomes> {
  final List<Map<String, dynamic>> _selectedSymptoms = [];

  void _handleSymptomSelected(String symptom, int value) {
    setState(() {
      _selectedSymptoms.add({'symptom': symptom, 'value': value});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 150),
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
                  height: 550,
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.only(left: 20, top: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Color(0xff16679a)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SymptomSelector(
                        onSelected: _handleSymptomSelected,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Symptômes sélectionnés :',
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          color: const Color(0xff707070),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10),
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
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: RichText(
                                            text: TextSpan(
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: _selectedSymptoms[index]
                                                      ['symptom'],
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
                                          child: Icon(Icons.close,
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
                    ],
                  )),
            ],
          )),
    );
  }
}