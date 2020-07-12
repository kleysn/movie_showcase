class Filme {
  String data;
  String genero;
  String link;
  String poster;
  String sinopse;
  String sinopseFull;
  String titulo;

  Filme({
    this.data,
    this.genero,
    this.link,
    this.poster,
    this.sinopse,
    this.sinopseFull,
    this.titulo,
  });

  Filme.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    genero = json['genero'];
    link = json['link'];
    poster = json['poster'];
    sinopse = json['sinopse'];
    sinopseFull = json['sinopseFull'];
    titulo = json['titulo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['data'] = this.data;
    data['genero'] = this.genero;
    data['link'] = this.link;
    data['poster'] = this.poster;
    data['sinopse'] = this.sinopse;
    data['sinopseFull'] = this.sinopseFull;
    data['titulo'] = this.titulo;
    return data;
  }
}
