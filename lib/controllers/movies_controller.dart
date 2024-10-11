import 'package:get/get.dart';
import 'package:flick_pulse/models/list_movies_model.dart';
import 'package:flick_pulse/services/movies_service.dart';

enum MovieCategory { popular, topRated, newReleases }

class MoviesController extends GetxController {
  var isLoading = false.obs;
  var moviesList = <Movie>[].obs;
  var selectedCategory = MovieCategory.popular.obs;
  var currentPage = 1;
  var hasMorePages = true.obs; // Track whether more pages are available

  @override
  void onInit() {
    super.onInit();
    fetchMovies(); // Fetch the first page of movies on initialization
  }

  // Method to fetch movies
  void fetchMovies({bool isLoadMore = false}) async {
    // Stop if already loading or if there are no more pages to load
    if (isLoading.value || (!isLoadMore && !hasMorePages.value)) return;

    isLoading.value = true;

    if (!isLoadMore) {
      currentPage = 1; // Reset page on fresh load
      hasMorePages.value = true; // Reset this flag on category change
      moviesList.clear(); // Clear list when changing categories
    } else {
      currentPage++; // Increment page for loading more data
    }

    List<Movie> movies = [];

    // Fetch movies based on the selected category
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

    // If the fetched movies list is empty, set hasMorePages to false
    if (movies.isEmpty) {
      hasMorePages.value = false;
    }

    // If loading more, append movies, otherwise replace the list
    if (isLoadMore) {
      moviesList.addAll(movies);
    } else {
      moviesList.value = movies;
    }

    isLoading.value = false; // Stop loading after fetching
  }

  // Method to change category and fetch movies for the new category
  void changeCategory(MovieCategory category) {
    if (selectedCategory.value != category) {
      selectedCategory.value = category;
      fetchMovies(); // Fetch movies for the newly selected category
    }
  }
}
