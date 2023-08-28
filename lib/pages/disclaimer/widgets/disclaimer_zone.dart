import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:translator/translator.dart';

import '../../../main.dart';
import '../../../model/langue_choose.dart';
import 'btn_valid.dart';

class DisclaimerZone extends StatelessWidget {
  const DisclaimerZone({super.key});

  final String textDisclaimer =
      "Cette application a été crée à but informatif et ne remplace en aucun cas la consultation chez un professionnel de la santé."
      " Merci de votre compréhension.";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Expanded(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: size.height * .45,
            width: size.width * .9,
            margin: const EdgeInsets.only(top: 80),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
          ),
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(500),
              color: Colors.white,
            ),
          ),
          Container(
            width: 140,
            height: 140,
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(500),
              color: const Color(0xff07beb8),
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const FaIcon(FontAwesomeIcons.triangleExclamation, color: Colors.white, size: 80),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 225, left: 30, right: 30),
            child: FutureBuilder(
              future: translator.translate(textDisclaimer, from: 'fr', to: context.watch<LangueChoose>().isEnglish ? 'en' : 'fr'),
              builder: (_, snap) {
                if (snap.hasData) {
                  var translation = snap.data as Translation;

                  return Text(
                    '$translation',
                    style: const TextStyle(color: Color(0xff707070), fontFamily: 'Segoe UI', fontSize: 20),
                    textAlign: TextAlign.center,
                  );
                }

                return Text(
                  textDisclaimer,
                  style: const TextStyle(color: Color(0xff707070), fontFamily: 'Segoe UI', fontSize: 20),
                  textAlign: TextAlign.center,
                );
              },
            ),
          ),
          const BtnValid()
        ],
      ),
    );
  }
}
