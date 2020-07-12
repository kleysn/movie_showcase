import 'package:flutter/material.dart';
import 'package:movie_showcase/models/filme.dart';
import 'package:movie_showcase/models/movie_response.dart';
import 'package:movie_showcase/repository/api/movie_api_provider.dart';
import 'package:rxdart/subjects.dart';

class HomeBloc {
  MovieApiProvider _movieApiProvider;
  final _moviesController = BehaviorSubject<List<Filme>>();
  Stream<List<Filme>> get moviesStream => _moviesController.stream;

  final _currentMovieController = BehaviorSubject<Filme>();
  Stream<Filme> get currentMovieStream => _currentMovieController.stream;

  HomeBloc() {
    _movieApiProvider = MovieApiProvider();
    getMovies();
  }

  void getMovies() async {
    MovieResponse response = await _movieApiProvider.getMovies();
    _moviesController.sink.add(response.filmes);
  }

  void updateCurrentMovie({@required Filme filme}) {
    _currentMovieController.sink.add(filme);
  }

  void dispose() {
    _moviesController.close();
    _currentMovieController.close();
  }
}
