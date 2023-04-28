import 'package:chloe/btn_continuer.dart';
import 'package:chloe/header.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'age_selector.dart';
import 'skin_color_selector.dart';
import 'gender_selector.dart';
import 'header.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  int selectedAge = 30; // L'âge par défaut est 30 ans

  void onSelectAge(int age) {
    // Mettre à jour la valeur de l'âge sélectionné
    setState(() {
      selectedAge = age;
    });
    // Vous pouvez faire d'autres choses avec la valeur de l'âge ici
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(
        backButton: true,
        title: 'Profil',
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
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
                        Text(
                          'Sexe :',
                          style: GoogleFonts.lato(
                            fontSize: 25,
                            color: const Color(0xff707070),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        GenderSelector(
                          onSelected: (gender) {
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
                          onSelectColor: (String selectedColor) {
                            // La couleur sélectionnée est transmise ici
                            print('Couleur sélectionnée : $selectedColor');
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
                            // Faites quelque chose avec la valeur de l'âge sélectionné
                            print('Âge sélectionné : $age');
                          },
                        ),
                        Container(
                          width: 289.0,
                          height: 56.0,
                          margin: const EdgeInsets.only(left: 10),
                          child: const BTNContinuer(),
                        ),
                      ])),
            ],
          )),
    );
  }
}
