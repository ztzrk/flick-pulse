import 'package:flick_pulse/constant/color_constant.dart';
import 'package:flick_pulse/controllers/movies_controller.dart';
import 'package:flick_pulse/controllers/main_controller.dart'; // Import the new MainController
import 'package:flick_pulse/screens/favorite/favorite_screen.dart';
import 'package:flick_pulse/screens/movie/widget/custom_bottom_navbar.dart';
import 'package:flick_pulse/screens/widgets/custom_choice_chip.dart';
import 'package:flick_pulse/screens/tv/tv_screen.dart';
import 'package:flick_pulse/screens/widgets/custom_circular_progress.dart';
import 'package:flick_pulse/screens/widgets/custom_grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MoviesController moviesController = Get.put(MoviesController());
    final MainController mainController = Get.put(MainController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flick Pulse',
          style: TextStyle(
            color: ColorConstant.fourthColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: ColorConstant.thirdColor,
        scrolledUnderElevation: 0,
      ),
      body: Obx(() {
        return IndexedStack(
          index: mainController.selectedIndex.value,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: 8.0,
                      children: [
                        CustomChoiceChip(
                          controller: moviesController,
                          icon: Icons.people,
                          category: MovieCategory.popular,
                          label: "Most Popular",
                        ),
                        CustomChoiceChip(
                          controller: moviesController,
                          icon: Icons.stars,
                          category: MovieCategory.topRated,
                          label: "Top Rated",
                        ),
                        CustomChoiceChip(
                          controller: moviesController,
                          icon: Icons.movie_filter,
                          category: MovieCategory.newReleases,
                          label: "New Releases",
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: moviesController.isLoading.value &&
                              moviesController.moviesList.isEmpty
                          ? const CustomCircularProgress()
                          : CustomGrid(
                              scrollController: mainController.scrollController,
                              moviesController: moviesController,
                            )),
                ],
              ),
            ),
            TvScreen(),
            FavoriteScreen(),
          ],
        );
      }),
      bottomNavigationBar: Obx(() {
        return CustomBottomNavbar(
          currentIndex: mainController.selectedIndex.value,
          onTap: (index) {
            mainController.changeTab(index);
            if (index != mainController.selectedIndex.value) {
              mainController.scrollToTop();
            }
          },
        );
      }),
    );
  }
}
