import 'package:flutter/material.dart';

class Doctolib extends StatelessWidget {
  const Doctolib({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: const Color(0xff048dd6),
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        const Align(
          alignment: Alignment(0.0, 0.226),
          child: SizedBox(
            width: 130.0,
            height: 25.0,
            child: Text(
              'Doctolib',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 25,
                color: Color(0xff048dd6),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
        ),
      ],
    );
  }
}
