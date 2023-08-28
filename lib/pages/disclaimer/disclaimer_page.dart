import 'package:flutter/material.dart';

import '../../res/colors.dart';
import 'widgets/disclaimer_zone.dart';
import 'widgets/swicth_language.dart';

class DisclaimerPage extends StatelessWidget {
  const DisclaimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: MyColors.background,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            const SwitchLanguage(),
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: Image.asset('assets/images/logo.png', height: 250),
            ),
            const DisclaimerZone(),
          ],
        ),
      ),
    );
  }
}
