import 'package:calculator_app/widgets/numPad_Button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorAppDemo());
}

class CalculatorAppDemo extends StatelessWidget {
  const CalculatorAppDemo({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Mitr',
        brightness: Brightness.light,
        primaryColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      home: const CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  late double firstNum;
  late double secondNum;
  late String history = '';
  late String textToDisplay = '0';
  late String res;
  late String operation = '';

  _appBar() {
    return AppBar(
      title: const Text(
        'CALCULATOR DEMO',
        style: TextStyle(fontSize: 24.0, color: Colors.black),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    );
  }

  _displayHistory() {
    return SizedBox(
      child: Align(
        alignment: Alignment.bottomRight,
        child: Text(
          history,
          style: const TextStyle(fontSize: 25.0, color: Colors.grey),
        ),
      ),
    );
  }

  _displayResult() {
    return SizedBox(
      child: Align(
        alignment: Alignment.bottomRight,
        child: Text(
          textToDisplay,
          style: const TextStyle(fontSize: 50.0, color: Colors.black),
        ),
      ),
    );
  }

  void onClick(String value) {
    print('onClicked : $value');

    if (value == 'C') {
      _clearCurrentDisplay();
    } else if (value == 'AC') {
      _clearAllDisplay();
    } else if (value == '+' || value == '-' || value == '×' || value == '÷' || value == '%' ) {
      _operation(value);
    } else if (value == '=') {
      _sumValue(value);
    }else if (value == '.'){
      _dotOperation(value);
    } else {

      if (textToDisplay.contains('+') || textToDisplay.contains('-') || textToDisplay.contains('×') || textToDisplay.contains('÷') || textToDisplay.contains('%')) {
        textToDisplay = textToDisplay.replaceFirst(textToDisplay[0], '');
      }

      if  (textToDisplay.contains('.')) {
      res = double.parse(textToDisplay + value).toString();
      } else {
      res = int.parse(textToDisplay + value).toString();
      }

    }

    setState(() {
      textToDisplay = res;
      history = history;
    });
  }

  _clearCurrentDisplay() {
    print('clearCurrentDisplay');
    firstNum = 0;
    secondNum = 0;
    textToDisplay = '0';
    res = '0';
  }

  _clearAllDisplay() {
    print('clearAllDisplay');
    firstNum = 0;
    secondNum = 0;
    textToDisplay = '0';
    res = '0';
    history = '';
  }

  _operation(String operator) {
    print('operation');
    firstNum = double.parse(textToDisplay);
    operation = operator;
    res = '';
  }

  _dotOperation(String operator) {
    print('dotOperation');
    res = '$textToDisplay$operator';
  }

  _sumValue(String value) {
    secondNum = double.parse(textToDisplay);
    if (operation == '') {
      res = (textToDisplay).toString();
      history =
          textToDisplay.toString();
    }

    if (operation == '+') {
      res = (firstNum + secondNum).toString();
      history =
          firstNum.toString() + operation.toString() + secondNum.toString();
    }

    if (operation == '-') {
      res = (firstNum - secondNum).toString();
      history =
          firstNum.toString() + operation.toString() + secondNum.toString();
    }

    if (operation == '×') {
      res = (firstNum * secondNum).toString();
      history =
          firstNum.toString() + operation.toString() + secondNum.toString();
    }

    if (operation == '÷') {
      res = (firstNum / secondNum).toString();
      history =
          firstNum.toString() + operation.toString() + secondNum.toString();
    }

    if (operation == '%') {
      res = (firstNum % secondNum).toString();
      history =
          firstNum.toString() + operation.toString() + secondNum.toString();
    }

    operation = '';

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 25, 25, 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _displayHistory(),
            _displayResult(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumPadButton(
                    n: 'AC', numPadType: NumPadTypes.symbol, callBack: onClick),
                NumPadButton(
                    n: 'C', numPadType: NumPadTypes.symbol, callBack: onClick),
                NumPadButton(
                    n: '%', numPadType: NumPadTypes.symbol, callBack: onClick),
                NumPadButton(
                    n: '÷', numPadType: NumPadTypes.symbol, callBack: onClick),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumPadButton(
                    n: '1', numPadType: NumPadTypes.number, callBack: onClick),
                NumPadButton(
                    n: '2', numPadType: NumPadTypes.number, callBack: onClick),
                NumPadButton(
                    n: '3', numPadType: NumPadTypes.number, callBack: onClick),
                NumPadButton(
                    n: '×', numPadType: NumPadTypes.symbol, callBack: onClick)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumPadButton(
                    n: '4', numPadType: NumPadTypes.number, callBack: onClick),
                NumPadButton(
                    n: '5', numPadType: NumPadTypes.number, callBack: onClick),
                NumPadButton(
                    n: '6', numPadType: NumPadTypes.number, callBack: onClick),
                NumPadButton(
                    n: '-', numPadType: NumPadTypes.symbol, callBack: onClick)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumPadButton(
                    n: '7', numPadType: NumPadTypes.number, callBack: onClick),
                NumPadButton(
                    n: '8', numPadType: NumPadTypes.number, callBack: onClick),
                NumPadButton(
                    n: '9', numPadType: NumPadTypes.number, callBack: onClick),
                NumPadButton(
                    n: '+', numPadType: NumPadTypes.symbol, callBack: onClick)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumPadButton(
                    n: '00', numPadType: NumPadTypes.number, callBack: onClick),
                NumPadButton(
                    n: '0', numPadType: NumPadTypes.number, callBack: onClick),
                NumPadButton(
                    n: '.', numPadType: NumPadTypes.symbol, callBack: onClick),
                NumPadButton(
                    n: '=', numPadType: NumPadTypes.symbol, callBack: onClick)
              ],
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
