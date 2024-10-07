import 'package:flick_pulse/controllers/movies_controller.dart';
import 'package:flick_pulse/screens/home/widget/movie_card.dart';
import 'package:flick_pulse/screens/home/widget/shimmer_place_holder.dart';
import 'package:flutter/material.dart';

class MovieGrid extends StatelessWidget {
  final ScrollController scrollController;
  final MoviesController moviesController;

  const MovieGrid({
    super.key,
    required this.scrollController,
    required this.moviesController,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      key: const PageStorageKey<String>('movieGrid'),
      controller: scrollController,
      padding: const EdgeInsets.only(top: 12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.67,
        mainAxisSpacing: 8,
        crossAxisSpacing: 4,
      ),
      // Calculate itemCount more safely
      itemCount: moviesController.moviesList.length +
          (moviesController.isLoading.value ? 6 : 0),
      itemBuilder: (context, index) {
        // Check if the index is within the bounds of moviesList
        if (index < moviesController.moviesList.length) {
          final movie = moviesController.moviesList[index];
          return MovieCard(movie: movie);
        } else {
          return const ShimmerPlaceHolder();
        }
      },
    );
  }
}
