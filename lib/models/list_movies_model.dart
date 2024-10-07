class Movie {
  final String title;
  final String posterPath;

  Movie({required this.title, required this.posterPath});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] ?? 'No Title',
      posterPath: json['poster_path'] ?? '',
    );
  }
}

class MoviesList {
  final List<Movie> movies;

  MoviesList({required this.movies});

  factory MoviesList.fromJson(Map<String, dynamic> json) {
    var movieList = json['results'] as List;
    List<Movie> movies =
        movieList.map((movieJson) => Movie.fromJson(movieJson)).toList();
    return MoviesList(movies: movies);
  }
}
