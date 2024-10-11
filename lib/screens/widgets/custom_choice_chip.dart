import 'package:flick_pulse/constant/color_constant.dart';
import 'package:flick_pulse/controllers/movies_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomChoiceChip extends StatelessWidget {
  final MoviesController controller;
  final IconData icon;
  final MovieCategory category;
  final String label;

  const CustomChoiceChip({
    super.key,
    required this.controller,
    required this.icon,
    required this.category,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ChoiceChip(
        avatar: Icon(
          icon,
          color: controller.selectedCategory.value == category
              ? ColorConstant.selectedTextColor
              : ColorConstant.secondaryColor,
        ),
        label: Text(
          label,
          style: TextStyle(
            color: controller.selectedCategory.value == category
                ? ColorConstant.selectedTextColor
                : ColorConstant
                    .secondaryColor, // Change text color when selected
          ),
        ),
        labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        selected: controller.selectedCategory.value == category,
        onSelected: (selected) {
          if (selected) {
            controller.changeCategory(category);
          }
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        backgroundColor: ColorConstant.thirdColor,
        selectedColor: ColorConstant
            .selectedBackgroundColor, // Apply new selected background color
        showCheckmark: false,
      );
    });
  }
}
