import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String equashion = "0";
  String result = "0";
  String expresion = "";
  double equationFontSize = 38.0;
  double resualtFontsize = 48.0;

  Widget numButton(String buttontext, Color btnColor, Color txtColor) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          if (buttontext == "C") {
            equashion = "0";
            result = "0";
            equationFontSize = 38.0;
            resualtFontsize = 48.0;
          } else if (buttontext == ("<=")) {
            equashion = equashion.substring(0, equashion.length - 1);
            if (equashion == "") {
              equashion = "0";
            }
          } else if (buttontext == "=") {
            equationFontSize = 38.0;
            resualtFontsize = 48.0;
            expresion = equashion;
            expresion = expresion.replaceAll("x", "*");
            expresion = expresion.replaceAll("÷", "/");
            try {
              Parser p = Parser();
              Expression exp = p.parse(expresion);
              ContextModel cm = ContextModel();
              result = "${exp.evaluate(EvaluationType.REAL, cm)}";
            } catch (e) {
              result = "Error";
            }
          } else {
            equationFontSize = 38.0;
            resualtFontsize = 48.0;
            if (equashion == "0") {
              equashion = buttontext;
            } else {
              equashion = equashion + buttontext;
            }
          }
        });
      },
      child: Text(
        buttontext,
        style: TextStyle(fontSize: 20, color: txtColor),
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(70, 70),
        shape: CircleBorder(),
        primary: btnColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Calculator"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Text(equashion,
                    style: TextStyle(fontSize: 48.0, color: Colors.white)),
              ),
              const Expanded(
                child: Divider(),
              ),
            ]),
            SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Text(result,
                    style: TextStyle(fontSize: 38.0, color: Colors.white)),
              ),
              Expanded(
                child: Divider(),
              ),
            ]),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("C", Colors.grey, Colors.black),
                numButton("+/-", Colors.grey, Colors.black),
                numButton("%", Colors.grey, Colors.black),
                numButton("÷", Colors.orange, Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("7", Colors.grey, Colors.black),
                numButton("8", Colors.grey, Colors.black),
                numButton("9", Colors.grey, Colors.black),
                numButton("x", Colors.orange, Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("4", Colors.grey, Colors.black),
                numButton("5", Colors.grey, Colors.black),
                numButton("6", Colors.grey, Colors.black),
                numButton("-", Colors.orange, Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("1", Colors.grey, Colors.black),
                numButton("2", Colors.grey, Colors.black),
                numButton("3", Colors.grey, Colors.black),
                numButton("+", Colors.orange, Colors.white),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("0", Colors.grey, Colors.black),
                numButton("<=", Colors.grey, Colors.black),
                numButton(".", Colors.grey, Colors.black),
                numButton("=", Colors.orange, Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
