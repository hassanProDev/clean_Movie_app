import 'package:clean_movie_app/core/error/failure.dart';
import 'package:clean_movie_app/movie_module/domain/entities/movie.dart';
import 'package:clean_movie_app/movie_module/domain/entities/movie_details.dart';
import 'package:clean_movie_app/movie_module/domain/entities/recommended_movie.dart';
import 'package:dartz/dartz.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure,List<Movie>>> getNowPlaying();

  Future<Either<Failure,List<Movie>>> getPopularMovie();

  Future<Either<Failure,List<Movie>>> getTopRatedMovie();
  Future<Either<Failure,MovieDetails>> getMovieDetails(int parameters);
  Future<Either<Failure,List<RecommendedMovie>>> getRecommendedMovie(int parameters);
}
