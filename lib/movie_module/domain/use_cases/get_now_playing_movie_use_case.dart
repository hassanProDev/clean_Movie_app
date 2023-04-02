import 'package:clean_movie_app/core/error/failure.dart';
import 'package:clean_movie_app/core/usecases/base_use_case.dart';
import 'package:clean_movie_app/movie_module/domain/entities/movie.dart';
import 'package:clean_movie_app/movie_module/domain/repository/base_movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetNowPlayingMovieUseCase extends BaseUseCase<List<Movie>,NoParameters>{
  final BaseMovieRepository baseMovieRepository;

  GetNowPlayingMovieUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure,List<Movie>>> call(NoParameters parameters) async{
    return await baseMovieRepository.getNowPlaying();
  }
}
