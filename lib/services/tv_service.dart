import 'package:dio/dio.dart';
import 'package:flick_pulse/env.dart';
import 'package:flick_pulse/models/tv_model.dart';

class TvService {
  static final Dio _dio = Dio();
  static const String _baseUrl = 'https://api.themoviedb.org/3/tv';

  static Future<List<Tv>> fetchPopularTVShows({int page = 1}) async {
    try {
      final response = await _dio.get('$_baseUrl/popular', queryParameters: {
        'api_key': Env.apiKey,
        'page': page,
      });

      List<Tv> tvShows = (response.data['results'] as List)
          .map((tv) => Tv.fromJson(tv))
          .toList();

      return tvShows;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
