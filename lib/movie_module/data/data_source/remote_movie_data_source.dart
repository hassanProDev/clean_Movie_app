import 'package:clean_movie_app/core/error/exception.dart';
import 'package:clean_movie_app/core/network/error_message_model.dart';
import 'package:clean_movie_app/core/utiles/api_constance.dart';
import 'package:clean_movie_app/movie_module/data/models/movie_details_model.dart';
import 'package:clean_movie_app/movie_module/data/models/movie_model.dart';
import 'package:clean_movie_app/movie_module/data/models/recommended_movie_model.dart';
import 'package:dio/dio.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlaying();

  Future<List<MovieModel>> getPopularMovie();

  Future<List<MovieModel>> getTopRatedMovie();
  Future<MovieDetailsModel> getMovieDetails(int id);
  Future<List<RecommendedMovieModel>> getRecommendedMovie(int id);
}

class MovieRemoteDataSource implements BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlaying() async {
    var response = await Dio().get(ApiConstance.nowPlayingPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovie() async{
    var response = await Dio().get(ApiConstance.popularMoviePath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovie() async{
    var response = await Dio().get(ApiConstance.topRatedMoviePath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(int id) async{
    final response =await Dio().get(ApiConstance.movieDetailsPath(id));
    if(response.statusCode==200){
      return MovieDetailsModel.fromJson(response.data);
    }else{

      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendedMovieModel>> getRecommendedMovie(int id) async{
    var response = await Dio().get(ApiConstance.recommendedMoviePath(id));


    if (response.statusCode == 200) {
      return List<RecommendedMovieModel>.from((response.data['results'] as List)
          .map((e) => RecommendedMovieModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
