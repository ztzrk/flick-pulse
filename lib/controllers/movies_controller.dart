import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flick_pulse/models/movie_model.dart';
import 'package:flick_pulse/services/movies_service.dart';

enum MovieCategory { popular, topRated, newReleases }

class MoviesController extends GetxController {
  var isLoading = false.obs;
  var moviesList = <Movie>[].obs;
  var selectedCategory = MovieCategory.popular.obs;
  var currentPage = 1;
  var hasMorePages = true.obs;
  late ScrollController scrollController;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
    fetchMovies();
  }

  void _scrollListener() {
    if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 200 &&
        !isLoading.value &&
        hasMorePages.value) {
      fetchMovies(isLoadMore: true);
    }
  }

  Future<void> fetchMovies({bool isLoadMore = false}) async {
    if (isLoading.value || (!isLoadMore && !hasMorePages.value)) return;

    isLoading.value = true;

    if (!isLoadMore) {
      currentPage = 1;
      hasMorePages.value = true;
      moviesList.clear();
    } else {
      currentPage++;
    }

    List<Movie> movies = [];

    switch (selectedCategory.value) {
      case MovieCategory.popular:
        movies = await MoviesService.fetchPopularMovies(page: currentPage);
        break;
      case MovieCategory.topRated:
        movies = await MoviesService.fetchTopRatedMovies(page: currentPage);
        break;
      case MovieCategory.newReleases:
        movies = await MoviesService.fetchNewReleases(page: currentPage);
        break;
    }

    if (movies.isEmpty) {
      hasMorePages.value = false;
    }

    if (isLoadMore) {
      moviesList.addAll(movies);
    } else {
      moviesList.value = movies;
    }

    isLoading.value = false;
  }

  void changeCategory(MovieCategory category) {
    if (selectedCategory.value != category) {
      selectedCategory.value = category;

      if (scrollController.hasClients) {
        scrollController.jumpTo(0);
      }
      moviesList.clear();
      fetchMovies();
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
