import 'dart:convert';

class MovieModel {
  //
  final bool adult;
  final String backdrop_path;
  final List genre_ids;
  final num id;
  final String original_language;
  final String original_title;
  final String overview;
  final num popularity;
  final String poster_path;
  final String release_date;
  final String title;
  final bool video;
  final num vote_average;
  final num vote_count;
  bool favorite = false;

  //
  MovieModel({
    this.adult,
    this.backdrop_path,
    this.genre_ids,
    this.id,
    this.original_language,
    this.original_title,
    this.overview,
    this.popularity,
    this.poster_path,
    this.release_date,
    this.title,
    this.video,
    this.vote_average,
    this.vote_count,
    this.favorite = false,
  });

  //
  Map<String, dynamic> toMap() {
    return {
      'adult': adult,
      'backdrop_path': backdrop_path,
      'genre_ids': genre_ids,
      'id': id,
      'original_language': original_language,
      'original_title': original_title,
      'overview': overview,
      'popularity': popularity,
      'poster_path': poster_path,
      'release_date': release_date,
      'title': title,
      'video': video,
      'vote_average': vote_average,
      'vote_count': vote_count,
      'favorite': favorite,
    };
  }

  //
  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      adult: map['adult'],
      backdrop_path: map['backdrop_path'],
      genre_ids: List.from(map['genre_ids']),
      id: map['id'],
      original_language: map['original_language'],
      original_title: map['original_title'],
      overview: map['overview'],
      popularity: map['popularity'],
      poster_path: map['poster_path'],
      release_date: map['release_date'],
      title: map['title'],
      video: map['video'],
      vote_average: map['vote_average'],
      vote_count: map['vote_count'],
      favorite: map['favorite'],
    );
  }

  //
  String toJson() => json.encode(toMap());

  //
  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source));
}
