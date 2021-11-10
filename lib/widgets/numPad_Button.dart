import 'package:flutter/material.dart';

enum NumPadTypes {
  number,
  symbol
}

class NumPadButton extends StatelessWidget {
  const NumPadButton({Key? key, required this.n, required this.numPadType, required this.callBack}) : super(key: key);
  final String n;
  final NumPadTypes numPadType;
  final Function? callBack;

  _textColors(NumPadTypes numPadType)  {
    if (numPadType == NumPadTypes.symbol) {
      return Colors.blueAccent;
    } else {
    return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        callBack!(n);
      },
      child: SizedBox(
        width: 70,
        height: 70,
        child: Center(
            child: Text(
              '$n',
              style:  TextStyle(fontSize: 24.0, color: _textColors(numPadType)),
            )),
      ),
    );
  }
}
