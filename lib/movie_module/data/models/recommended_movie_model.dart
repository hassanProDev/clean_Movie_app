import 'package:clean_movie_app/movie_module/domain/entities/recommended_movie.dart';

class RecommendedMovieModel extends RecommendedMovie {
  RecommendedMovieModel({
    required super.id,
    required super.poster_path,
  });

  factory RecommendedMovieModel.fromJson(Map<String, dynamic> json) {
    return RecommendedMovieModel(
      id: json["id"],
      poster_path: json["poster_path"],
    );
  }
}
