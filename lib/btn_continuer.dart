import 'package:chloe/page_symptomes.dart';
import 'package:flutter/material.dart';

class BTNContinuer extends StatelessWidget {
  const BTNContinuer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Symptomes()));
      },
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: const Color(0xff54cbc4),
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 200.0,
              height: 35.0,
              child: Text(
                'Continuer',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 25,
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
                softWrap: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
