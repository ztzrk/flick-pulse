import 'package:flick_pulse/constant/color_constant.dart';
import 'package:flutter/material.dart';

class CustomCircularProgress extends StatelessWidget {
  const CustomCircularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: ColorConstant.fourthColor,
      ),
    );
  }
}
