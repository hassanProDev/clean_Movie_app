import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_movie_app/core/utiles/enums.dart';
import 'package:clean_movie_app/movie_module/domain/use_cases/get_movie_details_use_case.dart';
import 'package:clean_movie_app/movie_module/domain/use_cases/get_recommended_movie_use_case.dart';
import 'package:clean_movie_app/movie_module/presentation/controller/movie_details_event.dart';
import 'package:clean_movie_app/movie_module/presentation/controller/movie_details_state.dart';


class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  GetMovieDetailsUseCase getMovieDetailsUseCase;
  GetRecommendedMovieUseCase getRecommendedMovieUseCase;

  MovieDetailsBloc(
    this.getMovieDetailsUseCase,
    this.getRecommendedMovieUseCase,
  ) : super(MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetRecommendedMovieEvent>(_getRecommendedMovie);
  }

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUseCase(event.id);
    result.fold(
        (l) => emit(state.copyWith(
              movieDetailsState: RequestState.error,
              movieDetailsMessage: l.message,
            )),
        (r) => emit(
              state.copyWith(
                movieDetails: r,
                movieDetailsState: RequestState.loaded,
              ),
            ));
  }

  FutureOr<void> _getRecommendedMovie(
      GetRecommendedMovieEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getRecommendedMovieUseCase(event.id);
    result.fold(
        (l) => emit(state.copyWith(
              recommendedMovieState: RequestState.error,
              recommendedMovieMessage: l.message,
            )),
        (r) => emit(
              state.copyWith(
                  recommendedMovie: r,
                  recommendedMovieState: RequestState.loaded),
            ));
  }
}
