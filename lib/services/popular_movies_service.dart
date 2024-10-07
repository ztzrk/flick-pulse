import 'package:dio/dio.dart';
import 'package:flick_pulse/models/list_movies_model.dart';

class PopularMoviesService {
  final Dio _dio = Dio();
  final String _apiKey = 'edbbdb4bddde7b1048a3ff5d8736ce74';

  Future<MoviesList> fetchPopularMovies({int page = 1}) async {
    try {
      final response = await _dio.get(
        'https://api.themoviedb.org/3/movie/popular',
        queryParameters: {
          'api_key': _apiKey,
          'language': 'en-US',
          'page': page,
        },
      );
      return MoviesList.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load popular movies: $e');
    }
  }
}
