import 'package:flutter/material.dart';

class BTNJeComprend extends StatelessWidget {
  BTNJeComprend({
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
          alignment: Alignment(-0.101, 0.29),
          child: SizedBox(
            width: 200.0,
            height: 25.0,
            child: Text(
              'Je comprends',
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
      ],
    );
  }
}
