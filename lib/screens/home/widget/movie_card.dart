import 'package:flick_pulse/constant/color_constant.dart';
import 'package:flick_pulse/models/list_movies_model.dart';
import 'package:flick_pulse/screens/home/widget/shimmer_place_holder.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: ColorConstant.secondaryColor,
        clipBehavior: Clip.antiAlias,
        child: Image.network(
          'https://image.tmdb.org/t/p/w500${movie.posterPath}',
          fit: BoxFit.cover,
          width: double.infinity,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return const ShimmerPlaceHolder();
            }
          },
          errorBuilder: (context, error, stackTrace) {
            return const ShimmerPlaceHolder();
          },
        ));
  }
}
