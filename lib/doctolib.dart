import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Doctolib extends StatelessWidget {
  const Doctolib({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        const url = 'https://www.doctolib.fr/';
        await launchUrl(Uri.parse(url));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        margin: const EdgeInsets.only(
          top: 10.0,
        ),
        decoration: BoxDecoration(
          color: const Color(0xff048dd6),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: const Text(
          'Doctolib',
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
    );
  }
}
