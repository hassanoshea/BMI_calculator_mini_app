import 'package:bmi_calculator_mini_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget? content;

  const CustomContainer({
    super.key,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: AppColors.activeContainerColor),
      child: content,
    );
  }
}
