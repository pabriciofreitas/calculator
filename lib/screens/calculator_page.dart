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
  bool animatedDisplay = false;

  _onPressed(String command) async {
    if (command == "C") {
      setState(() {
        animatedDisplay = true;
      });

      await Future.delayed(const Duration(milliseconds: 500));
    }
    print("oi");
    setState(() {
      animatedDisplay = false;
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
            child: DisplayWidget(
              callBack: _onPressed,
              text: memory.value,
              animatedDisplay: animatedDisplay,
            ),
          ),
          SizedBox(
              height: size.height * .55,
              child: KeyboardWidget(callBack: _onPressed)),
        ],
      ),
    );
  }
}
