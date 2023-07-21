import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import 'main.dart';
import 'model/langue_choose.dart';

class AgeSelector extends StatefulWidget {
  const AgeSelector({super.key, required this.onSelectAge});
  final Function(int) onSelectAge;

  @override
  State<AgeSelector> createState() => _AgeSelectorState();
}

class _AgeSelectorState extends State<AgeSelector> {
  int selectedAge = 30;
  String textAge = ' ans';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Center(
        child: SleekCircularSlider(
          min: 0,
          max: 100,
          initialValue: selectedAge.toDouble(),
          onChange: (double value) {
            setState(() {
              selectedAge = value.toInt();
            });
          },
          innerWidget: (double value) {
            return Center(
              child: FutureBuilder(
                  future: translator.translate(textAge, from: 'fr', to: context.watch<LangueChoose>().isEnglish ? 'en' : 'fr'),
                  builder: (context, snapshot) {
                    return Text(
                      snapshot.hasData ? '$selectedAge ${snapshot.data}' : '$selectedAge $textAge',
                      style: const TextStyle(fontSize: 20),
                    );
                  }),
            );
          },
          appearance: CircularSliderAppearance(
            customColors: CustomSliderColors(
              progressBarColors: [const Color(0xff16679a), const Color(0xff16679a)],
              trackColor: const Color(0xff16679a).withOpacity(0.2),
            ),
            customWidths: CustomSliderWidths(progressBarWidth: 10),
            infoProperties: InfoProperties(
              topLabelText: 'Âge',
              topLabelStyle: const TextStyle(fontSize: 16),
              modifier: (double value) {
                return '${value.toInt()} ans';
              },
            ),
          ),
          onChangeEnd: (double value) {
            widget.onSelectAge(value.toInt());
          },
        ),
      ),
    );
  }
}
