import 'package:clean_movie_app/movie_module/data/data_source/remote_movie_data_source.dart';
import 'package:clean_movie_app/movie_module/data/repository/movie_repository.dart';
import 'package:clean_movie_app/movie_module/domain/repository/base_movie_repository.dart';
import 'package:clean_movie_app/movie_module/domain/use_cases/get_movie_details_use_case.dart';
import 'package:clean_movie_app/movie_module/domain/use_cases/get_now_playing_movie_use_case.dart';
import 'package:clean_movie_app/movie_module/domain/use_cases/get_popular_movie_use_case.dart';
import 'package:clean_movie_app/movie_module/domain/use_cases/get_recommended_movie_use_case.dart';
import 'package:clean_movie_app/movie_module/domain/use_cases/get_top_rated_movie_use_case.dart';
import 'package:clean_movie_app/movie_module/presentation/controller/movie_bloc.dart';
import 'package:clean_movie_app/movie_module/presentation/controller/movie_details_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

class ServiceLocator {
  init() {
    sl.registerFactory(() => MovieBloc(sl(),sl(),sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(),sl()));
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
    sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));
    sl.registerLazySingleton(() => GetNowPlayingMovieUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMovieUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMovieUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendedMovieUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
  }
}
