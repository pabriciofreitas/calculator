import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculator/components/components.dart';
import 'package:flutter/material.dart';

class DisplayWidget extends StatefulWidget {
  final void Function(String) callBack;
  final String text;
  bool animatedDisplay;
  DisplayWidget({
    Key? key,
    required this.callBack,
    required this.text,
    required this.animatedDisplay,
  }) : super(key: key);

  @override
  State<DisplayWidget> createState() => _DisplayWidgetState();
}

class _DisplayWidgetState extends State<DisplayWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color:
            widget.animatedDisplay ? Colors.black12 : const Color(0xFFf5f6f8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: AutoSizeText(
                widget.text,
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
            const SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                  onPressed: () => widget.callBack("backButton"),
                  icon: const Icon(
                    Icons.backspace,
                    color: ButtonWidget.ONBACKGROUNDCOLOR,
                  )),
            )
          ],
        ),
      ),
      Positioned(
          bottom: 1,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            height: widget.animatedDisplay ? 550 : 50,
            width: widget.animatedDisplay ? 550 : 50,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(1000),
              ),
              color: Color(0xFFf5f6f8),
            ),
          )),
    ]);
  }
}
