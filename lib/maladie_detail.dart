import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'btn_recommencer.dart';
import 'doctolib.dart';
import 'expendable_button.dart';
import 'header.dart';
import 'main.dart';
import 'model/disease.dart';
import 'model/langue_choose.dart';

class MaladieDetail extends StatelessWidget {
  const MaladieDetail({Key? key, required this.disease}) : super(key: key);
  final Disease disease;
  final String textRDV = 'N\'hésitez pas à prendre RDV chez un spécialiste sur ';
  final String textPersonnesARisque = 'Personnes à risque';
  final String textPersonnesARisqueNonDisponible = 'Personnes à risque non disponible';
  final String textMedicaments = 'Médicaments';
  final String textMedicamentsNonDisponible = 'Médicaments non disponible';
  final String textDepistage = 'Dépistage';
  final String textDepistageNonDisponible = 'Dépistage non disponible';

  @override
  Widget build(BuildContext context) {
    String proceduresText = '';
    if (disease.testsProceduresList != null) {
      proceduresText = disease.testsProceduresList!.map((testProcedure) => testProcedure.nomFr ?? 'Procédure non disponible').join('\n');
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
                    FutureBuilder(
                        future: translator.translate('$textDepistage%$textDepistageNonDisponible',
                            from: 'fr', to: context.watch<LangueChoose>().isEnglish ? 'en' : 'fr'),
                        builder: (context, snapshot) {
                          return ExpandableButton(
                            buttonName: snapshot.hasData ? snapshot.data.toString().split('%')[0] : textDepistage,
                            label: context.watch().isEnglish ? proceduresText : proceduresText,
                          );
                        }),
                    const SizedBox(height: 15.0),
                    FutureBuilder(
                        future: translator.translate('$textMedicaments%$textMedicamentsNonDisponible',
                            from: 'fr', to: context.watch<LangueChoose>().isEnglish ? 'en' : 'fr'),
                        builder: (context, snapshot) {
                          return ExpandableButton(
                            buttonName: snapshot.hasData ? snapshot.data.toString().split('%')[0] : textMedicaments,
                            label: context.watch().isEnglish
                                ? disease.medicationDescription?.descriptionEn ??
                                    (snapshot.hasData ? snapshot.data.toString().split('%')[1] : textMedicamentsNonDisponible)
                                : disease.medicationDescription?.descriptionFr ?? textMedicamentsNonDisponible,
                          );
                        }),
                    const SizedBox(height: 15.0),
                    FutureBuilder(
                        future: translator.translate('$textPersonnesARisque%$textPersonnesARisqueNonDisponible',
                            from: 'fr', to: context.watch<LangueChoose>().isEnglish ? 'en' : 'fr'),
                        builder: (context, snapshot) {
                          return ExpandableButton(
                            buttonName: snapshot.hasData ? snapshot.data.toString().split('%')[0] : textPersonnesARisque,
                            label: context.watch().isEnglish
                                ? disease.whois?.descEn ??
                                    (snapshot.hasData ? snapshot.data.toString().split('%')[1] : textPersonnesARisqueNonDisponible)
                                : disease.whois?.descFr ?? textPersonnesARisqueNonDisponible,
                          );
                        }),
                    const SizedBox(height: 15.0),
                    FutureBuilder(
                        future: translator.translate(textRDV, from: 'fr', to: context.watch<LangueChoose>().isEnglish ? 'en' : 'fr'),
                        builder: (context, snapshot) {
                          return Text(
                            snapshot.hasData ? snapshot.data.toString() : textRDV,
                            style: GoogleFonts.lato(
                              fontSize: 18,
                              color: const Color(0xff707070),
                            ),
                            textAlign: TextAlign.center,
                          );
                        }),
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
