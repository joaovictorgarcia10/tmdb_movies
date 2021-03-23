import 'package:dio/dio.dart';
import 'package:tmdb_movies/app/models/movie_model.dart';
import 'package:tmdb_movies/app/models/page_model.dart';

class MoviesRepository {
// Atributes
  final Dio _dio;

// Constructor
  MoviesRepository(this._dio);

// getPopularMovies
  Future<List<MovieModel>> getPopularMovies(PageModel pageModel) async {
    final String url =
        "https://api.themoviedb.org/3/movie/popular?api_key=7bf3d91c2d03bfff4070e09093f589d3";

    return _dio.get(
      url,
      queryParameters: {
        'page': pageModel.page,
      },
    ).then(
      (response) => response?.data['results']
          .map<MovieModel>(
            (map) => MovieModel.fromMap(map),
          )
          ?.toList(),
    );
  }

// getUpcomingMovies
  Future<List<MovieModel>> getUpcomingMovies(PageModel pageModel) async {
    final String url =
        "https://api.themoviedb.org/3/movie/upcoming?api_key=7bf3d91c2d03bfff4070e09093f589d3";

    return _dio.get(
      url,
      queryParameters: {
        'page': pageModel.page,
      },
    ).then(
      (response) => response?.data['results']
          .map<MovieModel>(
            (map) => MovieModel.fromMap(map),
          )
          ?.toList(),
    );
  }

// searchMovies
  Future<List<MovieModel>> getSearchMovies(
    String query,
  ) async {
    final String url =
        "https://api.themoviedb.org/3/search/movie?api_key=7bf3d91c2d03bfff4070e09093f589d3";

    return _dio.get(
      url,
      queryParameters: {
        'query': query,
      },
    ).then(
      (response) => response?.data['results']
          .map<MovieModel>(
            (map) => MovieModel.fromMap(map),
          )
          ?.toList(),
    );
  }
}
