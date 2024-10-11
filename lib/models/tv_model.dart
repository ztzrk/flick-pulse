class Tv {
  final int id;
  final String name;
  final String overview;
  final String posterPath;

  Tv({
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
  });

  factory Tv.fromJson(Map<String, dynamic> json) {
    return Tv(
      id: json['id'],
      name: json['name'],
      overview: json['overview'],
      posterPath: json['poster_path'],
    );
  }
}
