import 'package:calculator/components/components.dart';
import 'package:flutter/material.dart';

class KeyboardWidget extends StatelessWidget {
  final void Function(String) callBack;
  const KeyboardWidget({
    Key? key,
    required this.callBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        ButtonRow(buttons: [
          ButtonWidget(
            bigButton: true,
            callBack: callBack,
            text: "C",
            onBackgroudColor: ButtonWidget.ERRORCOLOR,
          ),
          ButtonWidget(
            callBack: callBack,
            text: "%",
            onBackgroudColor: ButtonWidget.ONBACKGROUNDCOLOR,
          ),
          ButtonWidget(
            callBack: callBack,
            text: "/",
            onBackgroudColor: ButtonWidget.ONBACKGROUNDCOLOR,
          ),
        ]),
        ButtonRow(buttons: [
          ButtonWidget(
            callBack: callBack,
            text: "7",
          ),
          ButtonWidget(
            callBack: callBack,
            text: "8",
          ),
          ButtonWidget(
            callBack: callBack,
            text: "9",
          ),
          ButtonWidget(
            callBack: callBack,
            text: "x",
            onBackgroudColor: ButtonWidget.ONBACKGROUNDCOLOR,
          ),
        ]),
        ButtonRow(buttons: [
          ButtonWidget(
            callBack: callBack,
            text: "4",
          ),
          ButtonWidget(
            callBack: callBack,
            text: "5",
          ),
          ButtonWidget(
            callBack: callBack,
            text: "6",
          ),
          ButtonWidget(
            callBack: callBack,
            text: "-",
            onBackgroudColor: ButtonWidget.ONBACKGROUNDCOLOR,
          ),
        ]),
        ButtonRow(buttons: [
          ButtonWidget(
            callBack: callBack,
            text: "1",
          ),
          ButtonWidget(
            callBack: callBack,
            text: "2",
          ),
          ButtonWidget(
            callBack: callBack,
            text: "3",
          ),
          ButtonWidget(
            callBack: callBack,
            text: "+",
            onBackgroudColor: ButtonWidget.ONBACKGROUNDCOLOR,
          ),
        ]),
        ButtonRow(buttons: [
          ButtonWidget(
            bigButton: true,
            callBack: callBack,
            text: "0",
          ),
          ButtonWidget(
            callBack: callBack,
            text: ".",
          ),
          ButtonWidget(
            callBack: callBack,
            backgroudColor: ButtonWidget.ONBACKGROUNDCOLOR,
            onBackgroudColor: ButtonWidget.BACKGROUNDCOLOR,
            text: "=",
          ),
        ]),
      ],
    );
  }
}
