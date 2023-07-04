import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'btn_recommencer.dart';
import 'doctolib.dart';
import 'expendable_button.dart';
import 'header.dart';
import 'model/disease.dart';

class MaladieDetail extends StatelessWidget {
  const MaladieDetail({Key? key, required this.disease}) : super(key: key);
  final Disease disease;

  @override
  Widget build(BuildContext context) {
    String proceduresText = '';
    if (disease.testsProceduresList != null) {
      proceduresText = disease.testsProceduresList!
          .map((testProcedure) =>
              testProcedure.nomFr ?? 'Procédure non disponible')
          .join('\n');
    } else {
      proceduresText = 'Aucune procédure de test disponible.';
    }
    return Scaffold(
      appBar: const Header(
        backButton: true,
        title: 'Détails de la maladie',
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
                disease.name?.nomFr ?? 'Maladie',
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
              margin: const EdgeInsets.only(top: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      disease.description?.nomFr ?? 'Maladie',
                      style: GoogleFonts.lato(fontSize: 15.0),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20.0),
                    ExpandableButton(
                        buttonName: 'Dépistage', label: proceduresText),
                    const SizedBox(height: 15.0),
                    ExpandableButton(
                        buttonName: 'Médicaments',
                        label: disease.medicationDescription?.descriptionFr ??
                            'Médicaments non trouvés'),
                    const SizedBox(height: 15.0),
                    ExpandableButton(
                      buttonName: 'Personnes à risque',
                      label: disease.whois?.descFr ??
                          'Personnes à risque non disponible',
                    ),
                    const SizedBox(height: 15.0),
                    Text(
                      'N\'hésitez pas à prendre RDV chez un spécialiste sur ',
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        color: const Color(0xff707070),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Doctolib(),
                    const SizedBox(height: 20.0),
                    Container(
                      width: 289.0,
                      height: 56.0,
                      margin: const EdgeInsets.only(left: 10),
                      child: const BTNRecommencer(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
