import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'btn_recommencer.dart';
import 'expendable_button.dart';
import 'header.dart';

class MaladieDetail extends StatelessWidget {
  const MaladieDetail({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  Widget build(BuildContext context) {
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
                'Détails de la maladie 1', // Remplacez par le nom de la maladie
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
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed imperdiet risus porttitor arcu dictum, in vehicula odio consectetur. Nulla dignissim congue faucibus. Pellentesque ultrices in massa sed egestas. Morbi sodales, neque vel auctor eleifend, enim risus elementum libero, quis elementum nulla lacus eget metus.',
                      style: GoogleFonts.lato(fontSize: 15.0),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20.0),
                    const ExpandableButton(
                      buttonName: 'Dépistage',
                      categoryId: '1',
                    ),
                    const SizedBox(height: 15.0),
                    const ExpandableButton(
                      buttonName: 'Médicaments',
                      categoryId: '2',
                    ),
                    const SizedBox(height: 15.0),
                    const ExpandableButton(
                      buttonName: 'Personnes à risque',
                      categoryId: '3',
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
                    ElevatedButton(
                      onPressed: () {
                        // Ajoutez ici la logique pour ouvrir le lien Doctolib
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xff048DD6),
                      ),
                      child: const Text('Doctolib'),
                    ),
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
