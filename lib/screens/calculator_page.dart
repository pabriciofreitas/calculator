import 'package:calculator/components/components.dart';
import 'package:calculator/models/memory.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final Memory memory = Memory();
  _onPressed(String command) {
    setState(() {
      memory.applyCommand(command);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: DisplayWidget(text: memory.value),
          ),
          SizedBox(
              height: size.height * .55,
              child: KeyboardWidget(callBack: _onPressed)),
        ],
      ),
    );
  }
}
