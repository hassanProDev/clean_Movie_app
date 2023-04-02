
import 'package:clean_movie_app/core/error/failure.dart';
import 'package:clean_movie_app/core/usecases/base_use_case.dart';
import 'package:clean_movie_app/movie_module/domain/entities/recommended_movie.dart';
import 'package:clean_movie_app/movie_module/domain/repository/base_movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetRecommendedMovieUseCase extends BaseUseCase<List<RecommendedMovie>,int>{
  BaseMovieRepository baseMovieRepository;

  GetRecommendedMovieUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<RecommendedMovie>>> call(int parameters) async{
    return await baseMovieRepository.getRecommendedMovie(parameters);
  }

}