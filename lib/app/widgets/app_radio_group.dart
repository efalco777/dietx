import 'package:flutter/material.dart';

class AppRadioGroupData<T> {
  final T value;
  final String label;

  AppRadioGroupData({
    required this.value,
    required this.label,
  });
}

class AppRadioGroup<T> extends StatelessWidget {
  final List<AppRadioGroupData<T>> items;
  final T value;
  final ValueChanged<T> onValueChanged;

  const AppRadioGroup({
    super.key,
    required this.items,
    required this.value,
    required this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        children: List.generate(
          items.length,
          (index) => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio<T>(
                value: items[index].value,
                groupValue: value,
                onChanged: (value) => onValueChanged(value as T),
              ),
              Text(items[index].label)
            ],
          ),
        ),
      ),
    );
  }
}
