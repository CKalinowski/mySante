import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BtnResultat extends StatelessWidget {
  BtnResultat({
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
        Align(
          alignment: Alignment(-0.007, 0.259),
          child: SizedBox(
            width: 144.0,
            height: 29.0,
            child: Text(
              'Résultats',
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
          Pin(size: 27.2, end: 21.9),
          Pin(size: 21.4, middle: 0.5),
          child: Transform.rotate(
            angle: -1.5708,
            child: Stack(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Pinned.fromPins(
                      Pin(startFraction: 0.0, endFraction: 0.0),
                      Pin(startFraction: 0.0, endFraction: 0.0),
                      child: SvgPicture.string(
                        _svg_j5pc,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(startFraction: 0.0, endFraction: 0.0),
                      Pin(startFraction: 0.0, endFraction: 0.0),
                      child: Container(
                        decoration: BoxDecoration(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

const String _svg_j5pc =
    '<svg viewBox="0.0 0.0 27.2 21.4" ><path transform="translate(0.0, 0.0)" d="M 13.66708660125732 21.35677146911621 C 13.94206428527832 21.32999420166016 14.20327186584473 21.15910720825195 14.40945053100586 20.87166976928711 L 26.74821662902832 3.40180230140686 C 26.99350738525391 3.056564331054688 27.1413516998291 2.571463584899902 27.15897750854492 2.054559946060181 C 27.17682456970215 1.537396550178528 27.06279945373535 1.030285239219666 26.84246826171875 0.6453588604927063 C 26.62235260009766 0.2605192065238953 26.31355094909668 0.02966739982366562 25.98481178283691 0.003237294033169746 C 25.65601539611816 -0.02319280989468098 25.33416366577148 0.1575717628002167 25.09014129638672 0.5052359700202942 L 13.58038425445557 16.80697822570801 L 2.070625066757202 0.5052359700202942 C 1.826603889465332 0.1575717628002167 1.504749298095703 -0.02319280989468098 1.175954222679138 0.003237294033169746 C 0.8471590280532837 0.02966739982366562 0.5384143590927124 0.2605192065238953 0.3182995319366455 0.6453588604927063 C 0.09796434640884399 1.030285239219666 -0.01605910621583462 1.537310004234314 0.001788042718544602 2.054559946060181 C 0.01941485702991486 2.571463584899902 0.1672597527503967 3.056477785110474 0.4125478565692902 3.40180230140686 L 12.75131702423096 20.87166976928711 C 13.00200366973877 21.22236633300781 13.33272647857666 21.39776039123535 13.66708660125732 21.35677146911621 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
