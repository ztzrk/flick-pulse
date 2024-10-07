import 'package:flick_pulse/models/list_movies_model.dart';
import 'package:flick_pulse/services/popular_movies_service.dart';
import 'package:get/get.dart';

class MoviesController extends GetxController {
  var isLoading = false.obs;
  var moviesList = <Movie>[].obs;
  var currentPage = 1;
  var isLastPage = false.obs;

  final PopularMoviesService _moviesService = PopularMoviesService();

  @override
  void onInit() {
    super.onInit();
    fetchPopularMovies();
  }

  void fetchPopularMovies({bool isLoadMore = false}) async {
    if (isLoading.value || (isLoadMore && isLastPage.value)) return;

    try {
      isLoading(true);
      var moviesResponse =
          await _moviesService.fetchPopularMovies(page: currentPage);

      if (moviesResponse.movies.isNotEmpty) {
        moviesList.addAll(moviesResponse.movies);
        currentPage++;
      } else {
        isLastPage(true);
      }
    } catch (e) {
      print('Error fetching popular movies: $e');
    } finally {
      isLoading(false);
    }
  }
}
