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
          color: ColorConstant.secondaryColor,
        ),
        label: Text(label),
        labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        selected: controller.selectedCategory.value ==
            category, // Reactive to changes
        onSelected: (selected) {
          if (selected) {
            controller.changeCategory(category); // Update category on selection
          }
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        backgroundColor: ColorConstant.thirdColor,
        selectedColor: ColorConstant.fourthColor,
        showCheckmark: false,
      );
    });
  }
}
