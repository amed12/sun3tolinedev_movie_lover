import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sun3dev_movielover/models/models.dart';
import 'package:sun3dev_movielover/services/services.dart';
import 'package:equatable/equatable.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()){
    on<FetchMovies>((event, emit) async {
      List<Movie> movies = await MovieServices.getMovies(1);
      emit(MovieLoaded(
          movies: movies
              .where((element) =>
                  !element.title.toLowerCase().contains('365') &&
                  !element.title.toLowerCase().contains('bois'))
              .toList()));

    });
  }

}
