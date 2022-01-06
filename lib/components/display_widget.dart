import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DisplayWidget extends StatelessWidget {
  final String text;
  const DisplayWidget({
    Key? key,
    required this.text,
  }) : super(key: key);
//
  @override
  Widget build(BuildContext context) {
    bool animar = true;

    return Stack(children: [
      Container(
        color: Colors.red,
      ),
      Container(
        color: const Color(0xFFf5f6f8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(
                text,
                minFontSize: 40,
                maxFontSize: 80,
                maxLines: 1,
                textAlign: TextAlign.end,
                overflow: TextOverflow.clip,
                style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    decoration: TextDecoration.none,
                    fontSize: 80,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
