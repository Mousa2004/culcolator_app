import 'package:culcolator_app/component/customedbutton.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String resultText = '';
  String saveNumber = '';
  String saveOperator = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF17181A),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                width: double.infinity,
                child: Text(
                  textAlign: TextAlign.center,
                  resultText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Customedbutton(
                          name: "Ac",
                          background: Color(0xFF616161),
                          textcolor: Color(0xFFA5A5A5),
                          onPressed: clear,
                        ),
                        SizedBox(width: 20),
                        Customedbutton(
                          name: "</",
                          background: Color(0xFF616161),
                          textcolor: Color(0xFFA5A5A5),
                          onPressed: onBackClick,
                        ),
                        SizedBox(width: 20),
                        Customedbutton(
                          name: "/",
                          background: Color(0xFF005DB2),
                          textcolor: Color(0xff339DFF),
                          onPressed: onOperatorClick,
                        ),
                        SizedBox(width: 20),
                        Customedbutton(
                          name: "*",
                          background: Color(0xFF005DB2),
                          textcolor: Color(0xff339DFF),
                          onPressed: onOperatorClick,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Customedbutton(
                          name: "7",
                          background: Color(0xFF005DB2),
                          textcolor: Color(0xff339DFF),
                          onPressed: onAddNumber,
                        ),

                        SizedBox(width: 20),
                        Customedbutton(
                          name: "8",
                          background: Color(0xFF005DB2),
                          textcolor: Color(0xff339DFF),
                          onPressed: onAddNumber,
                        ),
                        SizedBox(width: 20),
                        Customedbutton(
                          name: "9",
                          background: Color(0xFF005DB2),
                          textcolor: Color(0xff339DFF),
                          onPressed: onAddNumber,
                        ),
                        SizedBox(width: 20),
                        Customedbutton(
                          name: "-",
                          background: Color(0xFF005DB2),
                          textcolor: Color(0xff339DFF),
                          onPressed: onOperatorClick,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Customedbutton(
                          name: "4",
                          background: Color(0xFF005DB2),
                          textcolor: Color(0xff339DFF),
                          onPressed: onAddNumber,
                        ),
                        SizedBox(width: 20),
                        Customedbutton(
                          name: "5",
                          background: Color(0xFF005DB2),
                          textcolor: Color(0xff339DFF),
                          onPressed: onAddNumber,
                        ),
                        SizedBox(width: 20),
                        Customedbutton(
                          name: "6",
                          background: Color(0xFF005DB2),
                          textcolor: Color(0xff339DFF),
                          onPressed: onAddNumber,
                        ),
                        SizedBox(width: 20),
                        Customedbutton(
                          name: "+",
                          background: Color(0xFF005DB2),
                          textcolor: Color(0xff339DFF),
                          onPressed: onOperatorClick,
                        ),
                      ],
                    ),

                    SizedBox(height: 20),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 8,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Customedbutton(
                                      name: "1",
                                      background: Color(0xFF005DB2),
                                      textcolor: Color(0xff339DFF),
                                      onPressed: onAddNumber,
                                    ),
                                    SizedBox(width: 20),
                                    Customedbutton(
                                      name: "2",
                                      background: Color(0xFF005DB2),
                                      textcolor: Color(0xff339DFF),
                                      onPressed: onAddNumber,
                                    ),
                                    SizedBox(width: 20),
                                    Customedbutton(
                                      name: "3",
                                      background: Color(0xFF005DB2),
                                      textcolor: Color(0xff339DFF),
                                      onPressed: onAddNumber,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Customedbutton(
                                      flex: 2,
                                      name: "0",
                                      background: Color(0xFF005DB2),
                                      textcolor: Color(0xff339DFF),
                                      onPressed: onAddNumber,
                                    ),
                                    SizedBox(width: 20),
                                    Customedbutton(
                                      name: ".",
                                      background: Color(0xFF005DB2),
                                      textcolor: Color(0xff339DFF),
                                      onPressed: onDotClick,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Customedbutton(
                                  name: "=",
                                  onPressed: onEqualClick,
                                  background: Color(0xFF005DB2),
                                  textcolor: Color(0xff339DFF),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onAddNumber(String digit) {
    resultText += digit;
    setState(() {});
  }

  void onOperatorClick(String operator) {
    if (resultText.isEmpty) return;
    if (saveNumber.isEmpty) {
      saveNumber = resultText;
    } else {
      calculate(saveNumber, saveOperator, resultText);
    }
    saveOperator = operator;
    resultText = '';
    setState(() {});
  }

  String calculate(String lhs, String operator, String rhs) {
    double num1 = double.parse(lhs);
    double num2 = double.parse(rhs);
    late double result;
    switch (operator) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '*':
        result = num1 * num2;
        break;
      case '/':
        result = num1 / num2;
        break;
    }
    return result.toString();
  }

  void onEqualClick(String _) {
    if (saveNumber.isEmpty || resultText.isEmpty) return;
    resultText = calculate(saveNumber, saveOperator, resultText);
    saveNumber = '';
    saveNumber = '';
    setState(() {});
  }

  void onDotClick(String digit) {
    if (resultText.contains(".")) return;
    resultText += digit;
    setState(() {});
  }

  void onBackClick(String _) {
    if (resultText.isEmpty) return;
    resultText = resultText.substring(0, resultText.length - 1);
    setState(() {});
  }

  void clear(String _) {
    resultText = '';
    saveNumber = '';
    saveOperator = '';
    setState(() {});
  }
}
