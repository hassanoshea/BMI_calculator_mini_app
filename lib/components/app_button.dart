import 'package:bmi_calculator_mini_app/constants/app_colors.dart';
import 'package:bmi_calculator_mini_app/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String btnTitle;
  final void Function()? btnFunction;
  final double? btnHeight;
   const AppButton(
      {required this.btnTitle,
      super.key,
      required this.btnFunction,
      this.btnHeight});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: btnFunction,
      child: Container(
        margin:  const EdgeInsets.all(10),
        height: btnHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.appButtonColor,
        ),
        width: double.infinity,
        child: Center(
          child: Text(
            btnTitle,
            style: AppTextStyle.appButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
