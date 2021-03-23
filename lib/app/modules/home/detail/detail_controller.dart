import 'package:get/get.dart';
import 'package:tmdb_movies/app/models/movie_model.dart';
import 'package:tmdb_movies/app/repository/movies_reposritory.dart';

class DetailController extends GetxController {
  // Instances
  final MoviesRepository _repository;

  // Obs Variables
  final _favoriteList = <MovieModel>[].obs;
  final _favoriteMovieFilter = MovieModel().obs;

  // Contructor
  DetailController(this._repository);

  // Get Variables
  bool get favorite => _favoriteMovieFilter.value.favorite;

  // Methods
  void addToFavoriteList() {
    _favoriteMovieFilter.update(
      (val) => val.favorite = !_favoriteMovieFilter.value.favorite,
    );

    print(_favoriteMovieFilter.value.favorite);
  }
}
