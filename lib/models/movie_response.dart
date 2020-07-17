import 'package:movie_showcase/models/filme.dart';

class MovieResponse {
  List<Filme> filmes;

  MovieResponse({this.filmes});

  static MovieResponse fromJson(Map<String, dynamic> json) {
    MovieResponse model = MovieResponse();
    if (json['filmes'] != null) {
      model.filmes = List<Filme>();
      json['filmes'].forEach((v) {
        model.filmes.add(Filme.fromJson(v));
      });
    }
    return model;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.filmes != null) {
      data['filmes'] = this.filmes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
