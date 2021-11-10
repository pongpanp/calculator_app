import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({Key? key, required this.num}) : super(key: key);
  final int num;

  @override
  Widget build(BuildContext context) {
    return  TextButton(
      onPressed: () {
        print(num);
      },
      child:  SizedBox(
        width: 70,
        height: 70,
        child: Center(
            child: Text(
              '$num',
              style: const TextStyle(fontSize: 24.0, color: Colors.black),
            )),
      ),
    );
  }
}
