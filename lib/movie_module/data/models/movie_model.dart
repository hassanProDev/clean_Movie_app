import 'package:clean_movie_app/movie_module/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel({
    required super.backdrop_path,
    required super.id,
    required super.title,
    required super.genre_ids,
    required super.overview,
    required super.release_date,
    required super.vote_average,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      backdrop_path: json['backdrop_path'],
      id: json["id"],
      title: json["title"],
      genre_ids: List<int>.from(json["genre_ids"].map((e)=>e)),
      overview: json["overview"],
      release_date: json["release_date"],
      vote_average: json["vote_average"],
    );
  }
}
