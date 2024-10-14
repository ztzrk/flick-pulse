import 'package:dio/dio.dart';
import 'package:flick_pulse/env.dart';
import 'package:flick_pulse/models/tv_model.dart';

class TvService {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static String apiKey = Env.apiKey;

  static Future<List<Tv>> fetchPopularTVShows({int page = 1}) async {
    try {
      var response = await Dio().get('$baseUrl/tv/popular', queryParameters: {
        'api_key': apiKey,
        'page': page,
      });

      List results = response.data['results'];
      return results.map((tv) => Tv.fromJson(tv)).toList();
    } catch (e) {
      return [];
    }
  }

  static Future<List<Tv>> fetchTopRatedTVShows({int page = 1}) async {
    try {
      var response = await Dio().get('$baseUrl/tv/top_rated', queryParameters: {
        'api_key': apiKey,
        'page': page,
      });

      List results = response.data['results'];
      return results.map((tv) => Tv.fromJson(tv)).toList();
    } catch (e) {
      return [];
    }
  }

  static Future<List<Tv>> fetchAiringTodayTVShows({int page = 1}) async {
    try {
      var response =
          await Dio().get('$baseUrl/tv/airing_today', queryParameters: {
        'api_key': apiKey,
        'page': page,
      });

      List results = response.data['results'];
      return results.map((tv) => Tv.fromJson(tv)).toList();
    } catch (e) {
      return [];
    }
  }
}
