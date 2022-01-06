import 'package:calculator/components/components.dart';
import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {
  final List<ButtonWidget> buttons;
  const ButtonRow({
    Key? key,
    required this.buttons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons,
      ),
    );
  }
}
