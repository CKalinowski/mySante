import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:google_fonts/google_fonts.dart';
import './header.dart';
import './choix_symptomes.dart';
import './btn_resultat.dart';
import './page2.dart';
import 'package:adobe_xd/page_link.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 172.0, start: -15.0),
            child: Header(),
          ),
          Pinned.fromPins(
            Pin(start: 7.0, end: 9.0),
            Pin(size: 474.0, middle: 0.4694),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x29000000),
                    offset: Offset(5, 5),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 58.0, end: 58.0),
            Pin(size: 30.0, middle: 0.1863),
            child: Text(
              'Quels sont vos symptômes ?',
              style: GoogleFonts.lato(
                fontSize: 25,
                color: const Color(0xff707070),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 141.0, start: 23.0),
            Pin(size: 30.0, middle: 0.2539),
            child: Text(
              'Symptômes :',
              style: GoogleFonts.lato(
                fontSize: 25,
                color: const Color(0xff707070),
                fontWeight: FontWeight.w500,
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 125.0, start: 23.0),
            Pin(size: 30.0, middle: 0.4024),
            child: Text(
              'Quantifier :',
              style: GoogleFonts.lato(
                fontSize: 25,
                color: const Color(0xff707070),
                fontWeight: FontWeight.w500,
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 80.0, end: 80.0),
            Pin(size: 273.0, middle: 0.6131),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                border: Border.all(width: 20.0, color: const Color(0xff847f7f)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 23.0, end: 22.0),
            Pin(size: 171.0, middle: 0.3837),
            child: ChoixSymptomes(),
          ),
          Pinned.fromPins(
            Pin(start: 77.0, end: 78.0),
            Pin(size: 165.0, middle: 0.6754),
            child: Container(
              color: const Color(0xffffffff),
            ),
          ),
          Align(
            alignment: const Alignment(0.36, -0.072),
            child: Container(
              width: 20.0,
              height: 20.0,
              decoration: const BoxDecoration(
                color: Color(0xff54cbc4),
                borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.003, 0.072),
            child: SizedBox(
              width: 113.0,
              height: 68.0,
              child: Text(
                '75%',
                style: GoogleFonts.lato(
                  fontSize: 57,
                  color: const Color(0xff54cbc4),
                  fontWeight: FontWeight.w700,
                ),
                softWrap: false,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 71.0, end: 70.0),
            Pin(size: 56.0, middle: 0.6564),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff54cbc4),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          const Align(
            alignment: Alignment(0.0, 0.31),
            child: SizedBox(
              width: 108.0,
              height: 35.0,
              child: Text(
                'Valider',
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
          Pinned.fromPins(
            Pin(size: 150.0, start: 35.0),
            Pin(size: 135.0, end: 92.0),
            child: const Text(
              'Symptôme 1\nSymptôme 2\nSymptôme 3\nSymptôme 4',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 25,
                color: Color(0xff847f7f),
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 12.0, start: 23.0),
            Pin(size: 12.0, middle: 0.7726),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff54cbc4),
                borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 12.0, start: 23.0),
            Pin(size: 12.0, end: 168.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff54cbc4),
                borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 12.0, start: 23.0),
            Pin(size: 11.0, end: 106.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff54cbc4),
                borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 12.0, start: 23.0),
            Pin(size: 11.0, end: 137.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff54cbc4),
                borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 71.0, end: 70.0),
            Pin(size: 56.0, end: 19.0),
            child:
                // Adobe XD layer: 'btn resultat' (component)
                PageLink(
              links: [
                PageLinkInfo(
                  duration: 5,
                  pageBuilder: () => const Page2(),
                ),
              ],
              child: BtnResultat(),
            ),
          ),
        ],
      ),
    );
  }
}
