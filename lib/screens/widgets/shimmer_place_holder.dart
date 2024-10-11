import 'package:flick_pulse/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPlaceHolder extends StatelessWidget {
  const ShimmerPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorConstant.secondaryColor,
      highlightColor: ColorConstant.secondaryColor.withOpacity(0.5),
      child: Container(
        color: ColorConstant.secondaryColor,
      ),
    );
  }
}
