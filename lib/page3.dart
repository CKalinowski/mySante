import 'package:flutter/material.dart';
import './doctolib.dart';
import 'package:adobe_xd/pinned.dart';
import './header.dart';
import './btn_resultat.dart';
import './disclaimer.dart';
import './onglet_deroulant.dart';

class Page3 extends StatelessWidget {
  Page3({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(0.0, 0.646),
            child: SizedBox(
              width: 180.0,
              height: 56.0,
              child:
                  // Adobe XD layer: 'doctolib' (component)
                  Doctolib(),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 172.0, start: -15.0),
            child:
                // Adobe XD layer: 'header' (component)
                Header(),
          ),
          Align(
            alignment: Alignment(0.0, -0.627),
            child: SizedBox(
              width: 182.0,
              height: 30.0,
              child: Text(
                'Détail Maladie 1',
                style: TextStyle(
                  fontFamily: 'Lato',
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
            Pin(start: 35.0, end: 14.0),
            Pin(size: 114.0, middle: 0.2555),
            child: SingleChildScrollView(
              primary: false,
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed imperdiet risus porttitor arcu dictum, in vehicula odio consectetur. Nulla dignissim congue faucibus. Pellentesque ultrices in massa sed egestas. Morbi sodales, neque vel auctor eleifend, enim risus elementum libero, quis elementum nulla lacus eget metus. ',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 16,
                  color: const Color(0xff707070),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 71.0, end: 70.0),
            Pin(size: 56.0, end: 19.0),
            child:
                // Adobe XD layer: 'btn resultat' (component)
                BtnResultat(),
          ),
          Pinned.fromPins(
            Pin(start: 50.0, end: 50.0),
            Pin(size: 55.0, middle: 0.7434),
            child: Text(
              'N\'hésitez pas à prendre RDV \nchez un spécialiste sur ',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 25,
                color: const Color(0xff847f7f),
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          Align(
            alignment: Alignment(0.0, 0.634),
            child: SizedBox(
              width: 130.0,
              height: 25.0,
              child: Text(
                'Doctolib',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 25,
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
                softWrap: false,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 13.0, end: 36.0),
            Pin(size: 19.0, start: 21.0),
            child: Text(
              '< Retour',
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 16,
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 8.0, end: 8.0),
            Pin(size: 59.0, middle: 0.5842),
            child:
                // Adobe XD layer: 'Onglet deroulant' (component)
                OngletDeroulant(),
          ),
          Pinned.fromPins(
            Pin(start: 8.0, end: 8.0),
            Pin(size: 59.0, middle: 0.4903),
            child:
                // Adobe XD layer: 'Onglet deroulant' (component)
                OngletDeroulant(),
          ),
          Pinned.fromPins(
            Pin(start: 8.0, end: 8.0),
            Pin(size: 59.0, middle: 0.3963),
            child:
                // Adobe XD layer: 'Onglet deroulant' (component)
                OngletDeroulant(),
          ),
        ],
      ),
    );
  }
}
