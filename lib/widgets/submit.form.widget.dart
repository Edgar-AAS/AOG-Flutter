import 'package:aog/widgets/calculate.widget.dart';
import 'package:aog/widgets/input.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class SubmitForm extends StatelessWidget {
  late final MoneyMaskedTextController _alcCrtl;
  late final MoneyMaskedTextController _gasCtrl;
  late final bool _busy;
  late final Function _submitFunc;

  SubmitForm({
    super.key,
    required MoneyMaskedTextController altCtrl,
    required MoneyMaskedTextController gasCtrl,
    required bool isBusy,
    required Function func,
  }) {
    _alcCrtl = altCtrl;
    _gasCtrl = gasCtrl;
    _busy = isBusy;
    _submitFunc = func;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Input(
            inputLabel: "Álcool:",
            maskedController: _alcCrtl,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Input(
            inputLabel: "Gasolina:",
            maskedController: _gasCtrl,
          ),
        ),
        CalculateButton(
          invert: false,
          busy: _busy,
          text: "CALCULAR",
          func: _submitFunc,
        ),
      ],
    );
  }
}
