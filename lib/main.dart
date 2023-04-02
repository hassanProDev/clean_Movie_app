import 'package:clean_movie_app/core/services/service_locator.dart';
import 'package:clean_movie_app/core/utiles/app_string.dart';
import 'package:clean_movie_app/movie_module/data/data_source/remote_movie_data_source.dart';
import 'package:clean_movie_app/movie_module/data/repository/movie_repository.dart';
import 'package:clean_movie_app/movie_module/domain/repository/base_movie_repository.dart';
import 'package:clean_movie_app/movie_module/domain/use_cases/get_movie_details_use_case.dart';
import 'package:clean_movie_app/movie_module/domain/use_cases/get_now_playing_movie_use_case.dart';
import 'package:clean_movie_app/movie_module/domain/use_cases/get_recommended_movie_use_case.dart';
import 'package:clean_movie_app/movie_module/presentation/screens/movies_screen.dart';
import 'package:flutter/material.dart';

void main() {
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      home:  MoviesScreen(),
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.grey.shade900
      ),
    );
  }
}
