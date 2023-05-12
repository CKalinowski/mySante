import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';

class BTNVoir extends StatelessWidget {
  const BTNVoir({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: const Color(0xff54cbc4),
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        Pinned.fromPins(
          Pin(start: 18.0, end: 18.0),
          Pin(size: 35.0, middle: 0.6452),
          child: const Text(
            'Voir +',
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
      ],
    );
  }
}
