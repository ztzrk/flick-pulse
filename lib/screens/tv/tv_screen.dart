import 'package:flick_pulse/models/tv_model.dart';
import 'package:flick_pulse/screens/widgets/custom_choice_chip.dart';
import 'package:flick_pulse/screens/widgets/custom_circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flick_pulse/controllers/tv_controller.dart';
import 'package:flick_pulse/screens/widgets/custom_grid.dart';

class TvScreen extends StatelessWidget {
  final TvController tvController = Get.put(TvController());

  TvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 8.0,
                  children: [
                    CustomChoiceChip<TvCategory>(
                      selectedCategory: tvController.selectedCategory,
                      onCategorySelected: (category) {
                        tvController.changeCategory(category);
                      },
                      icon: Icons.people,
                      category: TvCategory.popular,
                      label: "Most Popular",
                    ),
                    CustomChoiceChip<TvCategory>(
                      selectedCategory: tvController.selectedCategory,
                      onCategorySelected: (category) {
                        tvController.changeCategory(category);
                      },
                      icon: Icons.star,
                      category: TvCategory.topRated,
                      label: "Top Rated",
                    ),
                    CustomChoiceChip<TvCategory>(
                      selectedCategory: tvController.selectedCategory,
                      onCategorySelected: (category) {
                        tvController.changeCategory(category);
                      },
                      icon: Icons.live_tv,
                      category: TvCategory.airingToday,
                      label: "Airing Today",
                    ),
                  ],
                ),
              ),
              Expanded(
                child: tvController.isLoading.value &&
                        tvController.tvShowsList.isEmpty
                    ? const CustomCircularProgress()
                    : CustomGrid<Tv>(
                        scrollController: tvController.scrollController,
                        itemList: tvController.tvShowsList,
                        isLoading: tvController.isLoading.value,
                        getPosterPath: (tvShow) => tvShow.posterPath,
                      ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
