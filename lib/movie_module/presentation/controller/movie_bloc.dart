import 'dart:async';
import 'package:clean_movie_app/core/usecases/base_use_case.dart';
import 'package:clean_movie_app/core/utiles/enums.dart';
import 'package:clean_movie_app/movie_module/domain/use_cases/get_now_playing_movie_use_case.dart';
import 'package:clean_movie_app/movie_module/domain/use_cases/get_popular_movie_use_case.dart';
import 'package:clean_movie_app/movie_module/domain/use_cases/get_top_rated_movie_use_case.dart';
import 'package:clean_movie_app/movie_module/presentation/controller/movie_event.dart';
import 'package:clean_movie_app/movie_module/presentation/controller/movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  GetNowPlayingMovieUseCase getNowPlayingMovieUseCase;
  GetPopularMovieUseCase getPopularMovieUseCase;
  GetTopRatedMovieUseCase getTopRatedMovieUseCase;

  MovieBloc(
    this.getNowPlayingMovieUseCase,
    this.getPopularMovieUseCase,
    this.getTopRatedMovieUseCase,
  ) : super(MovieState()) {
    on<GetNowPlayingEvent>(_getNowPlaying);
    on<GetPopularEvent>(_getPopular);
    on<GetTopRatedEvent>(_getTopRated);
  }

  FutureOr<void> _getNowPlaying(
      GetNowPlayingEvent event, Emitter<MovieState> emit) async {
    final result = await getNowPlayingMovieUseCase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          nowPlayingState: RequestState.error,
          nowPlayingMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          nowPlayingMovie: r,
          nowPlayingState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getPopular(
      GetPopularEvent event, Emitter<MovieState> emit) async {
    final result = await getNowPlayingMovieUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
              popularState: RequestState.error,
              popularMessage: l.message,
            )),
        (r) => emit(
              state.copyWith(
                popularState: RequestState.loaded,
                popularMovie: r,
              ),
            ));
  }

  FutureOr<void> _getTopRated(
      GetTopRatedEvent event, Emitter<MovieState> emit) async {
    final result = await getTopRatedMovieUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
              topRatedState: RequestState.error,
              topRatedMessage: l.message,
            )),
        (r) => emit(
              state.copyWith(
                topRatedState: RequestState.loaded,
                topRatedMovie: r,
              ),
            ));
  }
}