import 'package:clean_movie_app/core/utiles/enums.dart';
import 'package:clean_movie_app/movie_module/domain/entities/movie.dart';

class MovieState {
  final List<Movie> nowPlayingMovie;
  final List<Movie> topRatedMovie;
  final List<Movie> popularMovie;
  final String nowPlayingMessage;
  final String popularMessage;
  final String topRatedMessage;
  final RequestState nowPlayingState;
  final RequestState popularState;
  final RequestState topRatedState;

  MovieState({
    this.nowPlayingMovie = const [],
    this.topRatedMovie = const [],
    this.popularMovie = const [],
    this.nowPlayingMessage = '',
    this.topRatedMessage = '',
    this.popularMessage = '',
    this.nowPlayingState = RequestState.loading,
    this.popularState = RequestState.loading,
    this.topRatedState = RequestState.loading,
  });

  MovieState copyWith({
    List<Movie>? nowPlayingMovie,
    List<Movie>? topRatedMovie,
    List<Movie>? popularMovie,
    String? nowPlayingMessage,
    String? popularMessage,
    String? topRatedMessage,
    RequestState? nowPlayingState,
    RequestState? popularState,
    RequestState? topRatedState,
  }) {
    return MovieState(
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
      popularMessage: popularMessage ?? this.popularMessage,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      popularState: popularState ?? this.popularState,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMovie: topRatedMovie ?? this.topRatedMovie,
      popularMovie: popularMovie ?? this.popularMovie,
      nowPlayingMovie: nowPlayingMovie ?? this.nowPlayingMovie,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieState &&
          runtimeType == other.runtimeType &&
          nowPlayingMovie == other.nowPlayingMovie &&
          topRatedMovie == other.topRatedMovie &&
          popularMovie == other.popularMovie &&
          nowPlayingMessage == other.nowPlayingMessage &&
          popularMessage == other.popularMessage &&
          topRatedMessage == other.topRatedMessage &&
          nowPlayingState == other.nowPlayingState &&
          popularState == other.popularState &&
          topRatedState == other.topRatedState;

  @override
  int get hashCode =>
      nowPlayingMovie.hashCode ^
      topRatedMovie.hashCode ^
      popularMovie.hashCode ^
      nowPlayingMessage.hashCode ^
      popularMessage.hashCode ^
      topRatedMessage.hashCode ^
      nowPlayingState.hashCode ^
      popularState.hashCode ^
      topRatedState.hashCode;
}
