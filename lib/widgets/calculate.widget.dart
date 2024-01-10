import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  final bool? invert;
  final bool? busy;
  final String? text;
  final Function func;

  const CalculateButton(
      {super.key, this.invert, this.busy, this.text, required this.func});

  @override
  Widget build(BuildContext context) {
    return busy ?? false
        ? Container(
            margin: const EdgeInsets.all(30),
            alignment: Alignment.center,
            height: 60,
            child: const CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          )
        : Container(
            margin: const EdgeInsets.all(30),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: invert ?? false
                  ? Theme.of(context).primaryColor
                  : Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(60),
            ),
            child: TextButton(
              onPressed: () async => func(),
              child: Text(
                text ?? "",
                style: TextStyle(
                  color: invert ?? false
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                  fontSize: 25,
                  fontFamily: "Big Shoulders Display",
                ),
              ),
            ),
          );
  }
}
