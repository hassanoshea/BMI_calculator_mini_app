import 'package:bmi_calculator_mini_app/screens/bmi_screen.dart';
import 'package:flutter/material.dart';

class AppFunctions extends BmiScreen{
   const AppFunctions({super.key});
   static Color resultColor = Colors.black;

  static dynamic resultTextCal() {
  if (bmi < 18.5 && bmi != 0) {
    resultText = 'UNDER WEIGHT';
    resultColor = Colors.red;
    resultMessage = 'You Are Lower Than Normal, You Have To Get More Weight.';
  } else if (bmi > 18.5 && bmi <= 25) {
    resultText = 'NORMAL';
    resultColor = Colors.green;
    resultMessage = 'You Are Normal, You Have To Keep Your Weight As Normal.';
  } else if (bmi > 25 && bmi <= 30) {
    resultText = "OVER WEIGHT";
    resultColor = Colors.yellow;
    resultMessage =
        'You Are Heigher Than Normal, You Have To Lose Some Weight.';
  } else if (bmi > 30) {
    resultText = "OBESITY";
    resultColor = Colors.red;
    resultMessage =
        'You Are Too Much Heigher Than Normal, You Have To Lose Some Weight.';
  }
  return (resultColor,resultText,resultMessage);
}
}