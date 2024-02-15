import 'package:bmi_calculator_mini_app/components/app_button.dart';
import 'package:bmi_calculator_mini_app/components/app_funs.dart';
import 'package:bmi_calculator_mini_app/components/custom_container.dart';
import 'package:bmi_calculator_mini_app/components/round_button.dart';
import 'package:bmi_calculator_mini_app/constants/app_colors.dart';
import 'package:bmi_calculator_mini_app/constants/app_text_styles.dart';
import 'package:bmi_calculator_mini_app/screens/result_screen.dart';
import 'package:flutter/material.dart';
class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}
int age = 20;
int weight = 60;
int height = 150;
double bmi = weight / (height * 0.01) * (height * 0.01);
String resultText = resultText;
String resultMessage = resultMessage;
Color maleColor = Colors.white;
Color femaleColor = Colors.white;

class _BmiScreenState extends State<BmiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(children: [
         Expanded(
          child: Row(
            children: [
              Expanded(
                child: CustomContainer(
                  content: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){
                            setState(() {
                              maleColor = Colors.red;
                              femaleColor = Colors.white;
                            });
                          },
                          child: Icon(
                            Icons.male,
                            size: 100,
                            color: maleColor,
                          ),
                        ),
                        const Text(
                          'MALE ',
                          style: AppTextStyle.labelTextStyle,
                        ),
                      ]),
                ),
              ),
              Expanded(
                child: CustomContainer(
                  content: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap:() {setState(() {
                            femaleColor = Colors.red;
                            maleColor = Colors.white;
                          });},
                          child: Icon(
                            Icons.female,
                            size: 100,
                            color: femaleColor,
                          ),
                        ),
                        const Text(
                          'FEMALE',
                          style: AppTextStyle.labelTextStyle,
                        )
                      ]),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: CustomContainer(
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'HIEGHT',
                  style: AppTextStyle.labelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$height',
                      style: AppTextStyle.numberTextStyle,
                    ),
                    const Text(
                      'cm',
                      style: AppTextStyle.labelTextStyle,
                    ),
                  ],
                ),
                Slider(
                  thumbColor: AppColors.appButtonColor,
                  activeColor: AppColors.appButtonColor,
                  value: height.toDouble(),
                  onChanged: (newValue) {
                    setState(() {
                      height = newValue.round();
                    });
                  },
                  min: 120,
                  max: 220,
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: CustomContainer(
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'WEIGHT',
                        style: AppTextStyle.labelTextStyle,
                      ),
                      Text('$weight', style: AppTextStyle.numberTextStyle),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                                btnIcon: const Icon(
                                  Icons.remove,
                                  size: 50,
                                  color: Colors.white,
                                ),
                                btnFunction: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            const SizedBox(
                              width: 20,
                            ),
                            RoundButton(
                                btnIcon: const Icon(
                                  Icons.add,
                                  size: 50,
                                  color: Colors.white,
                                ),
                                btnFunction: () {
                                  setState(() {
                                    weight++;
                                  });
                                })
                          ]),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: CustomContainer(
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'AGE',
                        style: AppTextStyle.labelTextStyle,
                      ),
                      Text('$age', style: AppTextStyle.numberTextStyle),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                                btnIcon: const Icon(
                                  Icons.remove,
                                  size: 50,
                                  color: Colors.white,
                                ),
                                btnFunction: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            const SizedBox(
                              width: 20,
                            ),
                            RoundButton(
                                btnIcon: const Icon(
                                  Icons.add,
                                  size: 50,
                                  color: Colors.white,
                                ),
                                btnFunction: () {
                                  setState(() {
                                    age++;
                                  });
                                })
                          ]),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        AppButton(
          btnTitle: 'Calculate',
          btnFunction: () {
            if (maleColor == Colors.red || femaleColor == Colors.red) {
              Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ResultsScreen(
                  bmi: bmi = weight / ((height * 0.01) * (height * 0.01)),
                  resultText: AppFunctions.resultTextCal(),
                  resultColor: AppFunctions.resultTextCal(),
                  resultMessage: AppFunctions.resultTextCal(),
                ),
              ),
            );
            }else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.red,
                content: Text('Please Select Your Gender')));
            }
          },
          btnHeight: 60,
        )
      ]),
    );
  }
}
