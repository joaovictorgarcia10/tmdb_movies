import 'package:get/get.dart';
import 'package:tmdb_movies/app/models/movie_model.dart';
import 'package:tmdb_movies/app/repository/movies_reposritory.dart';

class SearchController extends GetxController {
  // Instance
  final MoviesRepository _moviesRepository;

  // Variables
  final _searchMovies = <MovieModel>[].obs;

  // Constructor
  SearchController(this._moviesRepository);

  // Get
  List<MovieModel> get searchMovies => _searchMovies.toList();

  // Methods
  Future<void> findSearchMovies(String pattern) async {
    final searchMoviesData = await _moviesRepository.getSearchMovies(pattern);

    return _searchMovies.addAll(searchMoviesData);
  }

  void clearList() => _searchMovies.clear();
}
