import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main.dart';
import 'maladie_detail.dart';
import 'model/disease.dart';
import 'model/langue_choose.dart';

class MaladieItem extends StatelessWidget {
  const MaladieItem({
    Key? key,
    required this.maladie,
    required this.id,
    required this.diseases,
  }) : super(key: key);

  final String maladie;
  final String id;
  final Disease diseases;
  final String textVoir = 'Voir +';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 8.0,
                height: 8.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff54cbc4),
                ),
              ),
              const SizedBox(width: 8.0),
              Text(
                maladie,
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Color(0xff707070),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MaladieDetail(disease: diseases),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xff54cbc4),
            ),
            child: FutureBuilder(
                future: translator.translate(textVoir, from: 'fr', to: context.watch<LangueChoose>().isEnglish ? 'en' : 'fr'),
                builder: (context, snapshot) {
                  return Text(
                    snapshot.hasData ? snapshot.data.toString() : textVoir,
                    textAlign: TextAlign.center,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
