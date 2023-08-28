import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main.dart';
import 'model/langue_choose.dart';
import 'pages/disclaimer/disclaimer_page.dart';

class BTNRecommencer extends StatelessWidget {
  const BTNRecommencer({super.key});
  final textRecommencer = 'Recommencer';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const DisclaimerPage()));
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
                  future: translator.translate(textRecommencer, from: 'fr', to: context.watch<LangueChoose>().isEnglish ? 'en' : 'fr'),
                  builder: (context, snapshot) {
                    return Text(
                      snapshot.hasData ? snapshot.data.toString() : textRecommencer,
                      style: const TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 25,
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
