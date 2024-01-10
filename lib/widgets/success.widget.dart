import 'package:aog/widgets/calculate.widget.dart';
import 'package:flutter/material.dart';

class Success extends StatelessWidget {
  final String result;
  final Function reset;

  const Success({super.key, required this.result, required this.reset});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            result,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 45,
                fontFamily: "Big Shoulders Display"),
          ),
          CalculateButton(
            invert: true,
            busy: false,
            text: "CALCULAR NOVAMENTE",
            func: reset,
          ),
        ],
      ),
    );
  }
}
