import 'package:flutter/material.dart';

class AppSlider extends StatelessWidget {
  final int value;
  final int minValue;
  final int maxValue;
  final ValueChanged<int> onValueChanged;

  const AppSlider({
    super.key,
    required this.value,
    required this.minValue,
    required this.maxValue,
    required this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          alignment: Alignment.center,
          child: Text(value.toString()),
        ),
        Expanded(
          child: Slider(
            label: value.toString(),
            value: value.toDouble(),
            min: minValue.toDouble(),
            max: maxValue.toDouble(),
            onChanged: (value) => onValueChanged(value.toInt()),
          ),
        ),
      ],
    );
  }
}
