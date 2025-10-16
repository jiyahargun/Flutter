import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Calculator(), debugShowCheckedModeBanner: false));
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String input = '';
  String result = '';
  String operator = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(
          'Calculator',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
              child: Text(
                input.isEmpty ? '0' : input,
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 15),
            buildButtonRow(['AC', '%', 'C', '÷']),
            SizedBox(height: 12),
            buildButtonRow(['7', '8', '9', 'x']),
            SizedBox(height: 12),
            buildButtonRow(['4', '5', '6', '-']),
            SizedBox(height: 12),
            buildButtonRow(['1', '2', '3', '+']),
            SizedBox(height: 12),
            buildButtonRow(['0', '.', '=']),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildButtonRow(List<String> titles) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: titles.map((title) => buildButton(title)).toList(),
    );
  }

  Widget buildButton(String title) {
    bool isOperator = ['+', '-', 'x', '÷', '=', 'AC', 'C', '%'].contains(title);
    return ElevatedButton(
      onPressed: () => onPress(title),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.all(20),
        minimumSize: Size(75, 75),
        backgroundColor: isOperator ? Colors.orangeAccent : Colors.black87,
      ),
      child: Text(title, style: TextStyle(fontSize: 24, color: Colors.white)),
    );
  }

  void onPress(String title) {
    setState(() {
      if (title == 'AC') {
        input = '';
        result = '';
        operator = '';
      } else if (title == 'C') {
        if (input.isNotEmpty) input = input.substring(0, input.length - 1);
      } else if (title == '=') {
        calculate();
      } else if (['+', '-', 'x', '÷', '%'].contains(title)) {
        if (input.isNotEmpty && !input.endsWith(' ')) {
          input += ' $title ';
        }
      } else {
        input += title;
      }
    });
  }

  void calculate() {
    try {
      List<String> parts = input.split(' ');
      if (parts.length < 3) return;
      double num1 = double.parse(parts[0]);
      String op = parts[1];
      double num2 = double.parse(parts[2]);
      double res = 0;

      switch (op) {
        case '+':
          res = num1 + num2;
          break;
        case '-':
          res = num1 - num2;
          break;
        case 'x':
          res = num1 * num2;
          break;
        case '÷':
          res = num1 / num2;
          break;
        case '%':
          res = num1 % num2;
          break;
      }

      input = res.toString();
    } catch (e) {
      input = 'Error';
    }
  }
}
