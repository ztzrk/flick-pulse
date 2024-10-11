import 'package:flick_pulse/controllers/movies_controller.dart';
import 'package:flick_pulse/screens/widgets/custom_card.dart';
import 'package:flick_pulse/screens/widgets/shimmer_card.dart';
import 'package:flutter/material.dart';

class CustomGrid extends StatelessWidget {
  final ScrollController scrollController;
  final MoviesController moviesController;

  const CustomGrid({
    super.key,
    required this.scrollController,
    required this.moviesController,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      key: const PageStorageKey<String>('customGrid'),
      controller: scrollController,
      padding: const EdgeInsets.only(top: 12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.67,
        mainAxisSpacing: 8,
        crossAxisSpacing: 4,
      ),
      itemCount: moviesController.moviesList.length +
          (moviesController.isLoading.value ? 6 : 0),
      itemBuilder: (context, index) {
        if (index < moviesController.moviesList.length) {
          final movie = moviesController.moviesList[index];
          return CustomCard(movie: movie);
        } else {
          return const ShimmerCard();
        }
      },
    );
  }
}
