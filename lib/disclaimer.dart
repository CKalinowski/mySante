import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:translator/translator.dart';

import 'btn_je_comprends.dart';
import 'main.dart';
import 'model/langue_choose.dart';

class Disclaimer extends StatefulWidget {
  const Disclaimer({super.key});

  @override
  State<Disclaimer> createState() => _DisclaimerState();
}

class _DisclaimerState extends State<Disclaimer> {
  String textDisclaimer =
      "Cette application a été crée à but informatif et ne remplace en aucun cas la consultation chez un professionnel de la santé. Merci de votre compréhension.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff16679a),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 250,
                    height: 250,
                  ),
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        width: 350,
                        height: 400,
                        margin: const EdgeInsets.only(top: 80),
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(500),
                        ),
                      ),
                      Container(
                        width: 140,
                        height: 140,
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xff07beb8),
                          borderRadius: BorderRadius.circular(500),
                        ),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: const FaIcon(
                                FontAwesomeIcons.triangleExclamation,
                                color: Colors.white,
                                size: 80,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            top: 200, left: 30, right: 30),
                        child: FutureBuilder(
                            future: translator.translate(textDisclaimer,
                                from: 'fr',
                                to: context.watch<LangueChoose>().isEnglish
                                    ? 'en'
                                    : 'fr'),
                            builder: (_, snap) {
                              if (snap.hasData) {
                                var translation = snap.data as Translation;
                                return Text(
                                  '$translation',
                                  style: const TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontSize: 20,
                                    color: Color(0xff707070),
                                  ),
                                  textAlign: TextAlign.center,
                                );
                              }
                              return Text(
                                textDisclaimer,
                                style: const TextStyle(
                                  fontFamily: 'Segoe UI',
                                  fontSize: 20,
                                  color: Color(0xff707070),
                                ),
                                textAlign: TextAlign.center,
                              );
                            }),
                      ),
                      Container(
                        width: 289.0,
                        height: 56.0,
                        margin: const EdgeInsets.only(top: 370),
                        child: BTNJeComprend(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 10,
              right: 16,
              child: Row(
                children: [
                  Text(
                    'FR',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: !context.watch<LangueChoose>().isEnglish
                          ? FontWeight.w900
                          : FontWeight.normal,
                    ),
                  ),
                  Switch(
                    value: context.watch<LangueChoose>().isEnglish,
                    onChanged: (value) {
                      context.read<LangueChoose>().change();
                    },
                    activeColor: Colors.white,
                  ),
                  Text(
                    'EN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: context.watch<LangueChoose>().isEnglish
                          ? FontWeight.w900
                          : FontWeight.normal,
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
