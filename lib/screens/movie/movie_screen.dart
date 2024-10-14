import 'package:flick_pulse/constant/color_constant.dart';
import 'package:flick_pulse/controllers/movies_controller.dart';
import 'package:flick_pulse/controllers/main_controller.dart';
import 'package:flick_pulse/models/movie_model.dart';
import 'package:flick_pulse/screens/favorite/favorite_screen.dart';
import 'package:flick_pulse/screens/movie/widget/custom_bottom_navbar.dart';
import 'package:flick_pulse/screens/search/search_screen.dart';
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
        backgroundColor: ColorConstant.secondaryColor,
        scrolledUnderElevation: 0,
      ),
      body: Obx(() {
        return IndexedStack(
          index: mainController.selectedIndex.value,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
              ),
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: 8.0,
                      children: [
                        CustomChoiceChip<MovieCategory>(
                          selectedCategory: moviesController.selectedCategory,
                          onCategorySelected: (category) {
                            moviesController.changeCategory(category);
                          },
                          icon: Icons.people,
                          category: MovieCategory.popular,
                          label: "Most Popular",
                        ),
                        CustomChoiceChip<MovieCategory>(
                          selectedCategory: moviesController.selectedCategory,
                          onCategorySelected: (category) {
                            moviesController.changeCategory(category);
                          },
                          icon: Icons.star,
                          category: MovieCategory.topRated,
                          label: "Top Rated",
                        ),
                        CustomChoiceChip<MovieCategory>(
                          selectedCategory: moviesController.selectedCategory,
                          onCategorySelected: (category) {
                            moviesController.changeCategory(category);
                          },
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
                          : CustomGrid<Movie>(
                              scrollController:
                                  moviesController.scrollController,
                              itemList: moviesController.moviesList,
                              isLoading: moviesController.isLoading.value,
                              getPosterPath: (movie) => movie.posterPath,
                            )),
                ],
              ),
            ),
            TvScreen(),
            const SearchScreen(),
            const FavoriteScreen(),
          ],
        );
      }),
      bottomNavigationBar: Obx(() {
        return CustomBottomNavbar(
          currentIndex: mainController.selectedIndex.value,
          onTap: (index) {
            mainController.changeTab(index);
          },
        );
      }),
    );
  }
}
