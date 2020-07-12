import 'package:movie_showcase/models/filme.dart';

class MovieResponse {
  List<Filme> filmes;

  MovieResponse({this.filmes});

  MovieResponse.fromJson(Map<String, dynamic> json) {
    if (json['filmes'] != null) {
      filmes = List<Filme>();
      json['filmes'].forEach((v) {
        filmes.add(Filme.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.filmes != null) {
      data['filmes'] = this.filmes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
