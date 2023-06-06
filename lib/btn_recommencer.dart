import 'package:flutter/material.dart';

import 'disclaimer.dart';

class BTNRecommencer extends StatelessWidget {
  const BTNRecommencer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Disclaimer()));
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
                'Recommencer',
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