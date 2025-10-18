import 'package:culcolator_app/component/customedbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String resultText = '';
  String saveNumber = '';
  String saveOperator = '';
  bool isResultDisplayed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF17181A),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.centerRight,
                  width: double.infinity,
                  child: Text(
                    isResultDisplayed && resultText.isNotEmpty
                        ? "= $resultText"
                        : resultText,
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 48,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Customedbutton(
                                name: "Ac",
                                onPressed: clear,
                                background: Color(0xff616161),
                                textcolor: Color(0xFFFFFFFF),
                              ),
                              SizedBox(width: 10.w),
                              Customedbutton(
                                name: "</",
                                onPressed: onBackClick,
                                background: Color(0xff616161),
                                textcolor: Color(0xFFFFFFFF),
                              ),
                              SizedBox(width: 10.w),
                              Customedbutton(
                                name: "/",
                                onPressed: onOperatorClick,
                                background: Color(0xff005DB2),
                                textcolor: Color(0xFFFFFFFF),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            children: [
                              Customedbutton(name: "7", onPressed: onAddNumber),
                              SizedBox(width: 10.w),
                              Customedbutton(name: "8", onPressed: onAddNumber),
                              SizedBox(width: 10.w),
                              Customedbutton(name: "9", onPressed: onAddNumber),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            children: [
                              Customedbutton(name: "4", onPressed: onAddNumber),
                              SizedBox(width: 10.w),
                              Customedbutton(name: "5", onPressed: onAddNumber),
                              SizedBox(width: 10.w),
                              Customedbutton(name: "6", onPressed: onAddNumber),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            children: [
                              Customedbutton(name: "1", onPressed: onAddNumber),
                              SizedBox(width: 10.w),
                              Customedbutton(name: "2", onPressed: onAddNumber),
                              SizedBox(width: 10.w),
                              Customedbutton(name: "3", onPressed: onAddNumber),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            children: [
                              Customedbutton(
                                flex: 2,
                                name: "0",
                                onPressed: onAddNumber,
                              ),
                              SizedBox(width: 10.w),

                              SizedBox(width: 10.w),
                              Customedbutton(name: ".", onPressed: onDotClick),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20.h),
                    Expanded(
                      child: Column(
                        children: [
                          Customedbutton(
                            flex: 2,
                            name: "*",
                            onPressed: onOperatorClick,
                            background: Color(0xff005DB2),
                            textcolor: Color(0xFFFFFFFF),
                          ),
                          SizedBox(height: 20.h),
                          Customedbutton(
                            flex: 2,
                            name: "-",
                            onPressed: onOperatorClick,
                            background: Color(0xff005DB2),
                            textcolor: Color(0xFFFFFFFF),
                          ),
                          SizedBox(height: 20.h),
                          Customedbutton(
                            flex: 2,
                            name: "+",
                            onPressed: onOperatorClick,
                            background: Color(0xff005DB2),
                            textcolor: Color(0xFFFFFFFF),
                          ),
                          SizedBox(height: 20.h),
                          Customedbutton(
                            flex: 4,
                            name: "=",
                            onPressed: onEqualClick,
                            background: Color(0xFF29A8FF),
                            textcolor: Color(0xFFFFFFFF),
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
    );
  }

  void onAddNumber(String digit) {
    if (isResultDisplayed) {
      resultText = '';
      isResultDisplayed = false;
    }
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

    if (result == result.toInt()) {
      return result.toInt().toString();
    } else {
      return result.toString();
    }
  }

  void onEqualClick(String _) {
    if (saveNumber.isEmpty || resultText.isEmpty) return;
    resultText = calculate(saveNumber, saveOperator, resultText);
    saveNumber = '';
    saveOperator = '';
    isResultDisplayed = true;
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
    isResultDisplayed = false;
    setState(() {});
  }
}
