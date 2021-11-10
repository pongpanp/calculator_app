import 'package:calculator_app/widgets/calculator_button.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12,12,12,50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                CalculatorButton(num: 1),
                CalculatorButton(num: 2),
                CalculatorButton(num: 3),
              ],
            ),  // numPad 1-3
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                CalculatorButton(num: 4),
                CalculatorButton(num: 5),
                CalculatorButton(num: 6),
              ],
            ),  // numPad 4-6
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                CalculatorButton(num: 7),
                CalculatorButton(num: 8),
                CalculatorButton(num: 9),
              ],
            ),  // numPad 7-9

          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
