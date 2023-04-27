import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class AgeSelector extends StatefulWidget {
  final Function(int) onSelectAge;

  AgeSelector({required this.onSelectAge});

  @override
  _AgeSelectorState createState() => _AgeSelectorState();
}

class _AgeSelectorState extends State<AgeSelector> {
  int selectedAge = 30;

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
              child: Text(
                '$selectedAge ans',
                style: TextStyle(fontSize: 20),
              ),
            );
          },
          appearance: CircularSliderAppearance(
            customColors: CustomSliderColors(
              progressBarColors: [Color(0xff16679a), Color(0xff16679a)],
              trackColor: Color(0xff16679a).withOpacity(0.2),
            ),
            customWidths: CustomSliderWidths(progressBarWidth: 10),
            infoProperties: InfoProperties(
              topLabelText: 'Âge',
              topLabelStyle: TextStyle(fontSize: 16),
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
