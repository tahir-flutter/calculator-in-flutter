import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String value = "";
  int number1 = 0;
  int number2 = 0;
  String result = "";
  String operations = "";
  void click(String btn) {
    if (btn == "C" || btn == "c") {
      value = "";
      number1 = 0;
      number2 = 0;
      result = "";
    } else if (btn == '+' || btn == '-' || btn == '*' || btn == '/') {
      number1 = int.parse(value);
      result = "";
      operations = btn;
    } else if (btn == "=") {
      number2 = int.parse(value);
      if (operations == "+") {
        result = (number1 + number2).toString();
      }
      if (operations == "-") {
        result = (number1 - number2).toString();
      }
      if (operations == "*") {
        result = (number1 * number2).toString();
      }
      if (operations == "/") {
        result = (number1 ~/ number2).toString();
      }
    } else {
      result = int.parse(value + btn).toString();
    }
    setState(() {
      value = result;
    });
  }

  Widget commonbutton(String btn) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextButton(
          onPressed: () => click(btn),
          child: Text(
            '$btn',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 25,
            ),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Colors.greenAccent,
            //shadowColor: Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: Text(
            'CALCULATOR',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image(
                    image: NetworkImage("https://images.unsplash.com/photo-1574265932292-3d3d43b3c893?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 400,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10, 0.0),
                      child: Text(
                        '$value',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 40,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    commonbutton("7"),
                    commonbutton("8"),
                    commonbutton("9"),
                    commonbutton("C"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    commonbutton("4"),
                    commonbutton("5"),
                    commonbutton("6"),
                    commonbutton("+"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    commonbutton("1"),
                    commonbutton("2"),
                    commonbutton("3"),
                    commonbutton("-"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    commonbutton("0"),
                    commonbutton("="),
                    commonbutton("/"),
                    commonbutton("*"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
