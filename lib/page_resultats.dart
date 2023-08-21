import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'api.dart';
import 'header.dart';
import 'main.dart';
import 'maladie_item.dart';
import 'model/disease.dart';
import 'model/langue_choose.dart';

class Resultats extends StatefulWidget {
  const Resultats(
    this.selectedColor,
    this.selectedGender,
    this.selectedAge,
    this.selectedSymptoms, {
    Key? key,
  }) : super(key: key);

  final String selectedColor;
  final String selectedGender;
  final int selectedAge;
  final List<Map<String, dynamic>> selectedSymptoms;

  @override
  State<Resultats> createState() => _ResultatsState();
}

class _ResultatsState extends State<Resultats> {
  late Future<List<Disease>> futureDiseases;
  String textResultats = 'Vos résultats';
  String textResultatsPossibles =
      'Voici les résultats possibles liés à vos symptômes :';
  String textVerifMedecin =
      "Veuillez noter que ces résultats doivent être confirmés par un professionnel de la santé qualifié pour obtenir une évaluation médicale précise.";

  @override
  void initState() {
    super.initState();
    var api = Api(); // Initialisez l'instance d'Api ici
    String sexe = widget.selectedGender;
    futureDiseases = Api.getDiseases(
      // Utilisez l'instance d'Api pour appeler getDiseases
      age: widget.selectedAge,
      sex: sexe,
      ethnicity: widget.selectedColor,
      symptomsAndVelocity: widget.selectedSymptoms,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(
        backButton: true,
        title: 'Resultats',
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: FutureBuilder(
                  future: translator.translate(textResultats,
                      from: 'fr',
                      to: context.watch<LangueChoose>().isEnglish
                          ? 'en'
                          : 'fr'),
                  builder: (context, snapshot) {
                    return Text(
                      snapshot.hasData
                          ? snapshot.data.toString()
                          : textResultats,
                      style: GoogleFonts.lato(
                        fontSize: 25,
                        color: const Color(0xff707070),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    );
                  }),
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
                  FutureBuilder(
                      future: translator.translate(textResultatsPossibles,
                          from: 'fr',
                          to: context.watch<LangueChoose>().isEnglish
                              ? 'en'
                              : 'fr'),
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.hasData
                              ? snapshot.data.toString()
                              : textResultatsPossibles,
                          style: GoogleFonts.lato(
                            fontSize: 20,
                            color: const Color(0xff707070),
                          ),
                          textAlign: TextAlign.left,
                        );
                      }),
                  const SizedBox(height: 20),
                  Expanded(
                    child: FutureBuilder<List<Disease>>(
                      future: futureDiseases,
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Disease>> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              'Une erreur s\'est produite : ${snapshot.error}',
                            ),
                          );
                        } else if (snapshot.hasData) {
                          final diseases = snapshot.data!;
                          return ListView.builder(
                            itemCount: diseases.length,
                            itemBuilder: (BuildContext context, int index) {
                              final disease = diseases[index];
                              final diseaseNameFr =
                                  disease.name?.nomFr ?? 'Nom inconnu';
                              final diseaseNameEn =
                                  disease.name?.nomEn ?? 'Unknown Name';
                              return MaladieItem(
                                maladie: context.watch<LangueChoose>().isEnglish
                                    ? diseaseNameEn
                                    : diseaseNameFr,
                                id: disease.id.toString(),
                                diseases: disease,
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: Text('Aucun résultat trouvé.'),
                          );
                        }
                      },
                    ),
                  ),
                  FutureBuilder(
                      future: translator.translate(textVerifMedecin,
                          from: 'fr',
                          to: context.watch<LangueChoose>().isEnglish
                              ? 'en'
                              : 'fr'),
                      builder: (context, snapshot) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Text(
                            snapshot.hasData
                                ? snapshot.data.toString()
                                : textVerifMedecin,
                            style: GoogleFonts.lato(
                              fontSize: 15,
                              color: const Color(0xff707070),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
