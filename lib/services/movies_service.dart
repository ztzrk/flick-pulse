import 'package:dio/dio.dart';
import 'package:flick_pulse/env.dart';
import 'package:flick_pulse/models/movie_model.dart';

class MoviesService {
  static final Dio _dio = Dio();
  static const String _baseUrl = 'https://api.themoviedb.org/3';
  static final String _apiKey = Env.apiKey;

  static Future<List<Movie>> fetchPopularMovies({int page = 1}) async {
    final response = await _dio.get(
      '$_baseUrl/movie/popular',
      queryParameters: {
        'api_key': _apiKey,
        'language': 'en-US',
        'page': page,
      },
    );
    return _parseMovies(response.data);
  }

  static Future<List<Movie>> fetchTopRatedMovies({int page = 1}) async {
    final response = await _dio.get(
      '$_baseUrl/movie/top_rated',
      queryParameters: {
        'api_key': _apiKey,
        'language': 'en-US',
        'page': page,
      },
    );
    return _parseMovies(response.data);
  }

  static Future<List<Movie>> fetchNewReleases({int page = 1}) async {
    final response = await _dio.get(
      '$_baseUrl/movie/upcoming',
      queryParameters: {
        'api_key': _apiKey,
        'language': 'en-US',
        'page': page,
      },
    );
    return _parseMovies(response.data);
  }

  static List<Movie> _parseMovies(Map<String, dynamic> responseData) {
    var results = responseData['results'] as List;
    return results.map((movieData) => Movie.fromJson(movieData)).toList();
  }
}
