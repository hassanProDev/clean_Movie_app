
import 'package:clean_movie_app/core/error/exception.dart';
import 'package:clean_movie_app/core/error/failure.dart';
import 'package:clean_movie_app/movie_module/data/data_source/remote_movie_data_source.dart';
import 'package:clean_movie_app/movie_module/domain/entities/movie.dart';
import 'package:clean_movie_app/movie_module/domain/entities/movie_details.dart';
import 'package:clean_movie_app/movie_module/domain/entities/recommended_movie.dart';
import 'package:clean_movie_app/movie_module/domain/repository/base_movie_repository.dart';
import 'package:dartz/dartz.dart';

class MovieRepository implements BaseMovieRepository{
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MovieRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure,List<Movie>>> getNowPlaying() async{
    var result= await baseMovieRemoteDataSource.getNowPlaying();

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.status_message));
    }  }

  @override
  Future<Either<Failure,List<Movie>>> getPopularMovie() async{
     var result= await baseMovieRemoteDataSource.getPopularMovie();

     try{
       return Right(result);
     }on ServerException catch(failure){
       return Left(ServerFailure(failure.errorMessageModel.status_message));
     }
  }

  @override
  Future<Either<Failure,List<Movie>>> getTopRatedMovie() async{
    var result= await baseMovieRemoteDataSource.getTopRatedMovie();

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.status_message));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(int parameters) async{
    var result= await baseMovieRemoteDataSource.getMovieDetails(parameters);

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.status_message));
    }
  }

  @override
  Future<Either<Failure, List<RecommendedMovie>>> getRecommendedMovie(int parameters) async{
    var result= await baseMovieRemoteDataSource.getRecommendedMovie(parameters);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.status_message));
    }
  }

}