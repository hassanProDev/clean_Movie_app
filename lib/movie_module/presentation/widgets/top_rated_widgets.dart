import 'dart:developer';

import 'package:clean_movie_app/core/utiles/enums.dart';
import 'package:clean_movie_app/movie_module/presentation/controller/movie_bloc.dart';
import 'package:clean_movie_app/movie_module/presentation/controller/movie_state.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_movie_app/core/utiles/api_constance.dart';
import 'package:clean_movie_app/core/utiles/dummy.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class TopRatedWidgets extends StatelessWidget {
  const TopRatedWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (previous,current)=>previous.topRatedState!=current.topRatedState,
      builder: (context, state) {
        switch (state.nowPlayingState) {
          case RequestState.loading:
            return const SizedBox(
              height: 170,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.topRatedMovie.length,
                  itemBuilder: (context, index) {
                    final movie = state.topRatedMovie[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          /// TODO : NAVIGATE TO  MOVIE DETAILS
                        },
                        child: ClipRRect(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl:
                            ApiConstance.imageUrl(movie.backdrop_path!),
                            placeholder: (context, url) =>
                                Shimmer.fromColors(
                                  baseColor: Colors.grey[850]!,
                                  highlightColor: Colors.grey[800]!,
                                  child: Container(
                                    height: 170.0,
                                    width: 120.0,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          case RequestState.error:
            return SizedBox(
              height: 170,
              child: Center(
                child: Text(state.nowPlayingMessage),
              ),
            );
        }

      },
    );
  }
}
