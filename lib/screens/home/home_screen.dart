import 'package:flick_pulse/constant/color_constant.dart';
import 'package:flick_pulse/controllers/movies_controller.dart';
import 'package:flick_pulse/screens/home/widget/movie_grid.dart';
import 'package:flick_pulse/screens/widgets/custom_circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final MoviesController _controller = Get.put(MoviesController());
  final ScrollController _scrollController = ScrollController();

  HomeScreen({super.key}) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        _controller.fetchPopularMovies(isLoadMore: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Popular Movies',
          style: TextStyle(
            color: ColorConstant.fourthColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: ColorConstant.thirdColor,
        scrolledUnderElevation: 0,
      ),
      body: Obx(() {
        if (_controller.isLoading.value && _controller.moviesList.isEmpty) {
          return const CustomCircularProgress();
        } else {
          return Stack(
            children: [
              MovieGrid(
                scrollController: _scrollController,
                moviesController: _controller,
              ),
            ],
          );
        }
      }),
    );
  }
}
