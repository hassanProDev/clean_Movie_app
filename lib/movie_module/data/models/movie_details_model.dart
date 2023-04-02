import 'package:clean_movie_app/movie_module/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  MovieDetailsModel({
    required super.release_date,
    super.poster_path,
    required super.original_title,
    required super.overview,
    required super.genres,
    required super.id,
    required super.runtime,
    required super.vote_average,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      release_date: json["release_date"],
      poster_path: json["poster_path"]??"/fHWUxzEgCqIfToLjlY9UrR6uQtz.jpg",
      original_title: json["original_title"],
      overview: json["overview"],
      genres: List<GenresModel>.from(json["genres"].map((e) => GenresModel.fromJson(e))),
      id: json["id"],
      runtime: json["runtime"],
      vote_average: json["vote_average"],
    );
  }
}

class GenresModel extends Genres {
  GenresModel({
    required super.id,
    required super.name,
  });

  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(
      id: json["id"],
      name: json["name"],
    );
  }
}
