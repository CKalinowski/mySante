import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main.dart';
import 'model/langue_choose.dart';
import 'page_resultats.dart';

class BTNValider extends StatelessWidget {
  const BTNValider(this.selectedColor, this.selectedGender, this.selectedAge, this.selectedSymptoms, {super.key});
  final String selectedColor;
  final String selectedGender;
  final int selectedAge;
  final List<Map<String, dynamic>> selectedSymptoms;
  final String textValider = 'Valider';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Resultats(
                      'white',
                      selectedGender,
                      selectedAge,
                      selectedSymptoms,
                    )));
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
                  future: translator.translate(textValider, from: 'fr', to: context.watch<LangueChoose>().isEnglish ? 'en' : 'fr'),
                  builder: (context, snapshot) {
                    return Text(
                      snapshot.hasData ? snapshot.data.toString() : textValider,
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
    );
  }
}
