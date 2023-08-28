import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/langue_choose.dart';

class SwitchLanguage extends StatelessWidget {
  const SwitchLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.only(top: 10, right: 25),
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'FR',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: !context.watch<LangueChoose>().isEnglish ? FontWeight.w900 : FontWeight.normal,
            ),
          ),
          Switch(
            value: context.watch<LangueChoose>().isEnglish,
            onChanged: (value) => context.read<LangueChoose>().change(),
            activeColor: Colors.white,
          ),
          Text(
            'EN',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: context.watch<LangueChoose>().isEnglish ? FontWeight.w900 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
