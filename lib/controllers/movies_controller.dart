import 'package:flick_pulse/controllers/main_controller.dart';
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

  @override
  void onInit() {
    super.onInit();
    fetchMovies();
  }

  // Method to fetch movies
  void fetchMovies({bool isLoadMore = false}) async {
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
      fetchMovies();
      final MainController mainController = Get.find<MainController>();
      mainController.scrollToTop();
    }
  }
}
