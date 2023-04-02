
import 'package:clean_movie_app/core/utiles/enums.dart';
import 'package:clean_movie_app/movie_module/domain/entities/movie_details.dart';
import 'package:clean_movie_app/movie_module/domain/entities/recommended_movie.dart';

class MovieDetailsState {
  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;
  final List<RecommendedMovie> recommendedMovie;
  final RequestState recommendedMovieState;
  final String recommendedMovieMessage;

   MovieDetailsState({
    this.movieDetails,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = '',
    this.recommendedMovie=const [],
    this.recommendedMovieState = RequestState.loading,
    this.recommendedMovieMessage = '',
  });

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
    List<RecommendedMovie>? recommendedMovie,
    RequestState? recommendedMovieState,
    String? recommendedMovieMessage,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      recommendedMovie: recommendedMovie ?? this.recommendedMovie,
      recommendedMovieMessage: recommendedMovieMessage ?? this.recommendedMovieMessage,
      recommendedMovieState: recommendedMovieState ?? this.recommendedMovieState,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsState &&
          runtimeType == other.runtimeType &&
          movieDetails == other.movieDetails &&
          movieDetailsState == other.movieDetailsState &&
          movieDetailsMessage == other.movieDetailsMessage &&
          recommendedMovie == other.recommendedMovie &&
          recommendedMovieState == other.recommendedMovieState &&
          recommendedMovieMessage == other.recommendedMovieMessage;

  @override
  int get hashCode =>
      movieDetails.hashCode ^
      movieDetailsState.hashCode ^
      movieDetailsMessage.hashCode ^
      recommendedMovie.hashCode ^
      recommendedMovieState.hashCode ^
      recommendedMovieMessage.hashCode;
}
