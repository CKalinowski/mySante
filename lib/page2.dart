import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:google_fonts/google_fonts.dart';
import './header.dart';
import './btn_voir.dart';
import './page3.dart';
import 'package:adobe_xd/page_link.dart';
import './btn_resultat.dart';
import './disclaimer.dart';

class Page2 extends StatelessWidget {
  const Page2({
    Key? key,
  }) : super(key: key);
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
          Align(
            alignment: const Alignment(0.0, -0.627),
            child: SizedBox(
              width: 145.0,
              height: 30.0,
              child: Text(
                'Vos résultats',
                style: GoogleFonts.lato(
                  fontSize: 25,
                  color: const Color(0xff707070),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
                softWrap: false,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 23.0, end: 43.0),
            Pin(size: 60.0, middle: 0.2626),
            child: Text(
              'Voici les résultats possibles liés à vos symptômes :',
              style: GoogleFonts.lato(
                fontSize: 25,
                color: const Color(0xff707070),
                fontWeight: FontWeight.w500,
              ),
              softWrap: true,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 118.0, end: 30.0),
            Pin(size: 56.0, middle: 0.3836),
            child: PageLink(
              links: [
                PageLinkInfo(
                  duration: 5,
                  pageBuilder: () => Page3(),
                ),
              ],
              child: const BTNVoir(),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 140.0, start: 45.0),
            Pin(size: 135.0, end: 90.0),
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
            Pin(size: 12.0, middle: 0.775),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff54cbc4),
                borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 12.0, start: 23.0),
            Pin(size: 12.0, end: 165.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff54cbc4),
                borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 12.0, start: 23.0),
            Pin(size: 11.0, end: 100.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff54cbc4),
                borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 12.0, start: 23.0),
            Pin(size: 11.0, end: 135.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff54cbc4),
                borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 108.0, start: 61.0),
            Pin(size: 30.0, middle: 0.3869),
            child: Text(
              'Maladie 1',
              style: GoogleFonts.lato(
                fontSize: 25,
                color: const Color(0xff707070),
                fontWeight: FontWeight.w500,
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 12.0, start: 35.0),
            Pin(size: 12.0, middle: 0.3891),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff54cbc4),
                borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 118.0, end: 26.0),
            Pin(size: 56.0, middle: 0.468),
            child: PageLink(
              links: [
                PageLinkInfo(
                  duration: 5,
                  pageBuilder: () => Page3(),
                ),
              ],
              child: const BTNVoir(),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 108.0, start: 61.0),
            Pin(size: 30.0, middle: 0.469),
            child: Text(
              'Maladie 2',
              style: GoogleFonts.lato(
                fontSize: 25,
                color: const Color(0xff707070),
                fontWeight: FontWeight.w500,
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 12.0, start: 35.0),
            Pin(size: 12.0, middle: 0.4696),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff54cbc4),
                borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 118.0, end: 26.0),
            Pin(size: 56.0, middle: 0.5525),
            child: PageLink(
              links: [
                PageLinkInfo(
                  duration: 5,
                  pageBuilder: () => Page3(),
                ),
              ],
              child: const BTNVoir(),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 108.0, start: 61.0),
            Pin(size: 30.0, middle: 0.551),
            child: Text(
              'Maladie 3',
              style: GoogleFonts.lato(
                fontSize: 25,
                color: const Color(0xff707070),
                fontWeight: FontWeight.w500,
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 12.0, start: 35.0),
            Pin(size: 12.0, middle: 0.55),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff54cbc4),
                borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 118.0, end: 26.0),
            Pin(size: 56.0, middle: 0.637),
            child: PageLink(
              links: [
                PageLinkInfo(
                  duration: 5,
                  pageBuilder: () => Page3(),
                ),
              ],
              child: const BTNVoir(),
            ),
          ),
          Align(
            alignment: const Alignment(-0.596, 0.266),
            child: SizedBox(
              width: 108.0,
              height: 30.0,
              child: Text(
                'Maladie 4',
                style: GoogleFonts.lato(
                  fontSize: 25,
                  color: const Color(0xff707070),
                  fontWeight: FontWeight.w500,
                ),
                softWrap: false,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 12.0, start: 39.0),
            Pin(size: 12.0, middle: 0.6304),
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
            child: PageLink(
              links: [
                PageLinkInfo(
                  duration: 5,
                  pageBuilder: () => const Disclaimer(),
                ),
              ],
              child: BtnResultat(),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 18.0, end: 31.0),
            Pin(size: 19.0, start: 21.0),
            child: Text(
              '< Retour',
              style: GoogleFonts.lato(
                fontSize: 16,
                color: const Color(0xffffffff),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
