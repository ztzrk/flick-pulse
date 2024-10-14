import 'package:flick_pulse/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomChoiceChip<T> extends StatelessWidget {
  final Rx<T> selectedCategory;
  final void Function(T) onCategorySelected;
  final IconData icon;
  final T category;
  final String label;

  const CustomChoiceChip({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
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
          color: selectedCategory.value == category
              ? ColorConstant.fourthColor
              : ColorConstant.thirdColor,
        ),
        label: Text(
          label,
          style: TextStyle(
            color: selectedCategory.value == category
                ? ColorConstant.fourthColor
                : ColorConstant.thirdColor,
          ),
        ),
        labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        selected: selectedCategory.value == category,
        onSelected: (selected) {
          if (selected) {
            onCategorySelected(category);
          }
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(
            color: ColorConstant.secondaryColor,
          ),
        ),
        backgroundColor: ColorConstant.secondaryColor,
        selectedColor: ColorConstant.secondaryColor,
        showCheckmark: false,
      );
    });
  }
}
