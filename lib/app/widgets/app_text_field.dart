import 'package:dietx/app/theming/dimens.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String labelText;
  final String? initialText;

  const AppTextField({
    Key? key,
    required this.onChanged,
    required this.labelText,
    this.initialText,
  }) : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(text: widget.initialText);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: Dimens.small),
        filled: true,
        fillColor: Theme.of(context).primaryColor,
        hintText: '...',
        label: Container(
          padding: Insets.tiniest,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).primaryColor,
          ),
          child: Text(widget.labelText),
        ),
        hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
        enabledBorder: _border,
        errorBorder: _border,
        focusedBorder: _border,
        border: _border,
        disabledBorder: _border,
        focusedErrorBorder: _border,
      ),
    );
  }

  InputBorder get _border => const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      );
}
