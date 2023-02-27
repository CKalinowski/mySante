import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

class Header extends StatelessWidget {
  Header({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Pinned.fromPins(
          Pin(start: 0.0, end: 0.0),
          Pin(size: 60.0, start: 15.0),
          child: Container(
            color: const Color(0xff16679a),
          ),
        ),
        Pinned.fromPins(
          Pin(size: 141.0, middle: 0.5017),
          Pin(start: 15.0, end: 16.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xff16679a),
              borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
            ),
          ),
        ),
        Pinned.fromPins(
          Pin(size: 172.0, middle: 0.5039),
          Pin(start: 0.0, end: 0.0),
          child:
              // Adobe XD layer: '4' (shape)
              Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/logo.png'),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(88.0),
            ),
          ),
        ),
        Pinned.fromPins(
          Pin(size: 38.0, end: 57.0),
          Pin(size: 32.0, middle: 0.2071),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
              ),
              border: Border.all(width: 1.0, color: const Color(0xffffffff)),
            ),
          ),
        ),
        Pinned.fromPins(
          Pin(size: 38.0, end: 19.0),
          Pin(size: 32.0, middle: 0.2071),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
              border: Border.all(width: 1.0, color: const Color(0xffffffff)),
            ),
          ),
        ),
        Pinned.fromPins(
          Pin(size: 24.0, end: 28.0),
          Pin(size: 24.0, middle: 0.2162),
          child: Text(
            'FR',
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 20,
              color: const Color(0xff707070),
            ),
            textAlign: TextAlign.center,
            softWrap: false,
          ),
        ),
        Pinned.fromPins(
          Pin(size: 36.0, end: 56.0),
          Pin(size: 24.0, middle: 0.2162),
          child: Text(
            'EN',
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 20,
              color: const Color(0xffffffff),
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
