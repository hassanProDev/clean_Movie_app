

import 'package:clean_movie_app/core/error/failure.dart';
import 'package:clean_movie_app/core/usecases/base_use_case.dart';
import 'package:clean_movie_app/movie_module/domain/entities/movie_details.dart';
import 'package:clean_movie_app/movie_module/domain/repository/base_movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetails,int>{
  BaseMovieRepository baseMovieRepository;
  GetMovieDetailsUseCase(this.baseMovieRepository);
  @override
  Future<Either<Failure, MovieDetails>> call(int parameters) async{

    return await baseMovieRepository.getMovieDetails(parameters);
  }
}