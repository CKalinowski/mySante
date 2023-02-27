import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

class ChoixSymptomes extends StatelessWidget {
  ChoixSymptomes({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Pinned.fromPins(
          Pin(start: 0.0, end: 0.0),
          Pin(size: 39.0, start: 0.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(width: 1.0, color: const Color(0xff707070)),
            ),
          ),
        ),
        Pinned.fromPins(
          Pin(size: 195.0, start: 6.0),
          Pin(size: 23.0, start: 7.0),
          child: Text(
            'Choisir un symptôme ...',
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 19,
              color: const Color(0xff707070),
              fontWeight: FontWeight.w500,
            ),
            softWrap: false,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(width: 1.0, color: Colors.transparent),
          ),
          margin: EdgeInsets.fromLTRB(0.0, 39.0, 0.0, 0.0),
        ),
        Pinned.fromPins(
          Pin(size: 103.0, start: 6.0),
          Pin(size: 23.0, middle: 0.3378),
          child: Text(
            'symptôme 1',
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 19,
              color: Colors.transparent,
              fontWeight: FontWeight.w500,
            ),
            softWrap: false,
          ),
        ),
        Pinned.fromPins(
          Pin(size: 103.0, start: 6.0),
          Pin(size: 23.0, middle: 0.6284),
          child: Text(
            'symptôme 2',
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 19,
              color: Colors.transparent,
              fontWeight: FontWeight.w500,
            ),
            softWrap: false,
          ),
        ),
        Pinned.fromPins(
          Pin(size: 103.0, start: 6.0),
          Pin(size: 23.0, end: 12.0),
          child: Text(
            'symptôme 3',
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 19,
              color: Colors.transparent,
              fontWeight: FontWeight.w500,
            ),
            softWrap: false,
          ),
        ),
      ],
    );
  }
}
