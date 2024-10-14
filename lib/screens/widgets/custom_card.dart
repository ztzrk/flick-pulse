import 'package:flutter/material.dart';
import 'package:flick_pulse/constant/color_constant.dart';
import 'package:flick_pulse/screens/widgets/shimmer_place_holder.dart';

class CustomCard<T> extends StatelessWidget {
  final T item;
  final String Function(T) getPosterPath;

  const CustomCard({
    super.key,
    required this.item,
    required this.getPosterPath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorConstant.secondaryColor,
      clipBehavior: Clip.antiAlias,
      child: Image.network(
        'https://image.tmdb.org/t/p/w500${getPosterPath(item)}',
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
      ),
    );
  }
}
