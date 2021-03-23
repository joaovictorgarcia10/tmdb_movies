import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:tmdb_movies/app/models/movie_model.dart';

class PageModel {
  int page;
  List<MovieModel> results;
  int total_pages;
  int total_results;

  PageModel({
    this.page,
    this.results,
    this.total_pages,
    this.total_results,
  });

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'results': results?.map((x) => x?.toMap())?.toList(),
      'total_pages': total_pages,
      'total_results': total_results,
    };
  }

  factory PageModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PageModel(
      page: map['page'],
      results: List<MovieModel>.from(
          map['results']?.map((x) => MovieModel.fromMap(x))),
      total_pages: map['total_pages'],
      total_results: map['total_results'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PageModel.fromJson(String source) =>
      PageModel.fromMap(json.decode(source));

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PageModel &&
        o.page == page &&
        listEquals(o.results, results) &&
        o.total_pages == total_pages &&
        o.total_results == total_results;
  }

  @override
  int get hashCode {
    return page.hashCode ^
        results.hashCode ^
        total_pages.hashCode ^
        total_results.hashCode;
  }

  @override
  String toString() {
    return 'PageModel(page: $page, results: $results, total_pages: $total_pages, total_results: $total_results)';
  }
}
