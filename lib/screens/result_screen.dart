import 'package:bmi_calculator_mini_app/components/app_button.dart';
import 'package:bmi_calculator_mini_app/components/app_funs.dart';
import 'package:bmi_calculator_mini_app/components/custom_container.dart';
import 'package:bmi_calculator_mini_app/constants/app_colors.dart';
import 'package:bmi_calculator_mini_app/constants/app_text_styles.dart';
import 'package:bmi_calculator_mini_app/screens/bmi_screen.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key,
      required bmi,
      required resultText,
      required resultColor,
      required resultMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Result',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Colors.white),
            ),
            Expanded(
              child: CustomContainer(
                content: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        resultText,
                        style: TextStyle(color: AppFunctions.resultColor, fontSize: 35),
                      ),
                      Text(
                        bmi.toStringAsFixed(1),
                        style: AppTextStyle.numberTextStyle,
                      ),
                      Text(
                        resultMessage,
                        style: TextStyle(
                            fontSize: 16, color: AppFunctions.resultColor),
                      ),
                      const Row(),
                    ],
                  ),
                ),
              ),
            ),
            AppButton(
              btnTitle: 'RECALCULATE',
              btnFunction: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const BmiScreen()));
              },
              btnHeight: 60,
            )
          ],
        ),
      ),
    );
  }
}
