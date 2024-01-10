import 'package:aog/widgets/logo.widget.dart';
import 'package:aog/widgets/submit.form.widget.dart';
import 'package:aog/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _color = Colors.orange;

  var _alcCrtl = MoneyMaskedTextController();
  var _gasCtrl = MoneyMaskedTextController();

  var _busy = false;
  var _completed = false;
  var _resultText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        color: _color,
        duration: const Duration(milliseconds: 1000),
        child: ListView(
          children: [
            const Logo(),
            _completed
                ? Success(
                    result: _resultText,
                    reset: reset,
                  )
                : SubmitForm(
                    func: () async {
                      _calculate();
                    },
                    isBusy: _busy,
                    altCtrl: _alcCrtl,
                    gasCtrl: _gasCtrl,
                  )
          ],
        ),
      ),
    );
  }

  Future _calculate() async {
    final regExp = RegExp(r'[,]');
    double alc = double.parse(_alcCrtl.text.replaceAll(regExp, '')) / 100;
    double gas = double.parse(_gasCtrl.text.replaceAll(regExp, '')) / 100;
    double result = alc / gas;

    setState(() {
      _color = Colors.deepOrange;
      _completed = false;
      _busy = true;
    });

    await Future.delayed(const Duration(milliseconds: 500));

    setState(() {
      if (result > 0.0) {
        if (result >= 0.7) {
          _resultText = "Compensa utilizar Gasolina";
        } else {
          _resultText = "Compensa utilizar Álcool";
        }
        _completed = true;
        _busy = false;
      } else {
        _busy = false;
      }
    });
  }

  reset() {
    setState(() {
      _alcCrtl = MoneyMaskedTextController();
      _gasCtrl = MoneyMaskedTextController();
      _completed = false;
      _busy = false;
      _color = Colors.orange;
    });
  }
}
