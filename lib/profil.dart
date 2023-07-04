import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'btn_continuer.dart';
import 'gender_selector.dart';
import 'header.dart';
import 'selector_age.dart';
import 'selector_skin_color.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  String selectedColor = 'Caucasien'; // La couleur par défaut est caucasien
  String selectedGender = 'male'; // Le sexe par défaut est homme
  int selectedAge = 30; // L'âge par défaut est 30 ans

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(
        backButton: true,
        title: 'Profil',
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
                  'Votre profil',
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
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.only(left: 20, top: 20),
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
                          'Sexe :',
                          style: GoogleFonts.lato(
                            fontSize: 25,
                            color: const Color(0xff707070),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        GenderSelector(
                          onSelectedGender: (gender) {
                            setState(() {
                              selectedGender = gender;
                            });
                            print('Sexe sélectionné : $gender');
                          },
                        ),
                        Text(
                          'Ethnie :',
                          style: GoogleFonts.lato(
                            fontSize: 25,
                            color: const Color(0xff707070),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SkinColorSelector(
                          onSelectColor: (String color) {
                            setState(() {
                              selectedColor = color;
                            });
                            // La couleur sélectionnée est transmise ici
                            print('Couleur sélectionnée : $color');
                          },
                        ),
                        Text(
                          'Votre âge :',
                          style: GoogleFonts.lato(
                            fontSize: 25,
                            color: const Color(0xff707070),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        // selecteur age
                        AgeSelector(
                          onSelectAge: (int age) {
                            setState(() {
                              selectedAge = age;
                            });
                            // Faites quelque chose avec la valeur de l'âge sélectionné
                            print('Âge sélectionné : $age');
                          },
                        ),
                        Container(
                          width: 289.0,
                          height: 56.0,
                          margin: const EdgeInsets.only(left: 10),
                          child: BTNContinuer(
                            selectedColor,
                            selectedGender,
                            selectedAge,
                          ),
                        ),
                      ])),
            ],
          )),
    );
  }
}
