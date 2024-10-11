import 'package:flick_pulse/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Shimmer.fromColors(
        baseColor: ColorConstant.secondaryColor,
        highlightColor: ColorConstant.secondaryColor.withOpacity(0.5),
        child: Container(
          color: ColorConstant.secondaryColor,
        ),
      ),
    );
  }
}
