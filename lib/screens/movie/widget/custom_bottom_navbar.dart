import 'package:flutter/material.dart';
import 'package:flick_pulse/constant/color_constant.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.movie),
          label: 'Movies',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.tv),
          label: 'TV Shows',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: ColorConstant.selectedTextNavbarColor,
      unselectedItemColor: ColorConstant.unselectedTextNavbarColor,
      backgroundColor: ColorConstant.thirdColor,
      onTap: onTap,
    );
  }
}
