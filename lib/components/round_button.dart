import 'package:bmi_calculator_mini_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final Icon btnIcon;
  final void Function()? btnFunction;
  final double? btnRadius;

  const RoundButton(
      {required this.btnIcon,
      super.key,
      required this.btnFunction,
      this.btnRadius});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: btnFunction,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.roundButtonColor,
        ),
        width: btnRadius,
        height: btnRadius,
        child: Center(child: (btnIcon)),
      ),
    );
  }
}
