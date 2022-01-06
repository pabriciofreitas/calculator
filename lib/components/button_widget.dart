import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  static const BACKGROUNDCOLOR = Color(0xffffffff);
  static const ONBACKGROUNDCOLOR = Color(0xff3e8ed3);
  static const ERRORCOLOR = Color(0xffe57e5f);
  final bool bigButton;
  final String text;
  final Color backgroudColor;
  final Color onBackgroudColor;
  final void Function(String) callBack;
  const ButtonWidget({
    Key? key,
    this.bigButton = false,
    required this.text,
    this.backgroudColor = BACKGROUNDCOLOR,
    this.onBackgroudColor = Colors.black54,
    required this.callBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: bigButton ? 2 : 1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: const BorderSide(
              style: BorderStyle.solid, width: 0.5, color: Color(0xFFf5f6f8)),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          primary: backgroudColor,
        ),
        onPressed: () => callBack(text),
        child: Text(
          text,
          style: TextStyle(
              color: onBackgroudColor,
              fontSize: 30,
              fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
