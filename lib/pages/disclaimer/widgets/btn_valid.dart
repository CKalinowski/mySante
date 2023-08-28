import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';
import '../../../model/langue_choose.dart';
import '../../../profil.dart';

class BtnValid extends StatelessWidget {
  const BtnValid({super.key});

  final String textJeComprend = 'Je comprends';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Positioned(
      bottom: 50,
      child: SizedBox(
        height: 60,
        width: size.width * .8,
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Profil()));
          },
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xff54cbc4),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 200.0,
                  height: 35.0,
                  child: FutureBuilder(
                      future: translator.translate(textJeComprend, from: 'fr', to: context.watch<LangueChoose>().isEnglish ? 'en' : 'fr'),
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.hasData ? snapshot.data.toString() : textJeComprend,
                          style: const TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 25,
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                          softWrap: false,
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
