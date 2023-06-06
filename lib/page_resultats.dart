import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'header.dart';
import 'maladie_item.dart';

class Resultats extends StatefulWidget {
  const Resultats({super.key});

  @override
  State<Resultats> createState() => _ResultatsState();
}

class _ResultatsState extends State<Resultats> {
  final List<Map<String, dynamic>> _maladies = [
    {'maladie': 'Maladie 1', 'id': '1'},
    {'maladie': 'Maladie 2', 'id': '2'},
    // Ajoutez plus de maladies ici si nécessaire
  ];

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
              child: Text(
                'Vos résultats',
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
                  Text(
                    'Voici les résultats possibles liés à vos symptômes :',
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      color: const Color(0xff707070),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _maladies.length,
                      itemBuilder: (BuildContext context, int index) {
                        final maladie = _maladies[index]['maladie'] as String;
                        final id = _maladies[index]['id'] as String;
                        return MaladieItem(
                          maladie: maladie,
                          id: id,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
