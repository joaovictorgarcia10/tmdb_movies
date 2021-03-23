import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_movies/app/models/movie_model.dart';
import 'package:tmdb_movies/app/models/page_model.dart';

import 'package:tmdb_movies/app/repository/movies_reposritory.dart';

class HomeController extends GetxController {
  // Atributes Instances
  final MoviesRepository _moviesRepository;

  // Variáveis OBServáveis
  final _popularMovies = <MovieModel>[].obs;
  final _pagination = PageModel().obs;
  final _lastPage = false.obs;
  final _selectedList = true.obs;

  HomeController(
    this._moviesRepository,
  );

  // Métodos Get (para acessar na view)
  List<MovieModel> get popularMovies => _popularMovies.toList();
  int get _page => _pagination.value.page;
  bool get lastPage => _lastPage.value;
  bool get selectedList => _selectedList.value;

  // On Init - Ao Iniciar...
  @override
  void onInit() {
    ever(_pagination, (_) => findMovies());
    _changePage(1);
    super.onInit();
  }

  // Métodos
  void changeList() {
    _selectedList.value = !_selectedList.value;

    //
    _popularMovies.clear();
    _changePage(1);

    if (_selectedList.value) {
      print("Lista Populares ${_selectedList.value}");
    } else {
      print("Lista Em Cartaz ${_selectedList.value}");
    }
  }

  Future<void> findMovies() async {
    print('Find Movies - Page $_pagination');
    await Future.delayed(Duration(seconds: 1));

    final popularMoviesData = _selectedList.value
        ? await _moviesRepository.getPopularMovies(_pagination.value)
        : await _moviesRepository.getUpcomingMovies(_pagination.value);

    if (popularMoviesData.isEmpty) {
      _lastPage.value = true;
    }

    _popularMovies.addAll(popularMoviesData);
  }

  void _changePage(int page) {
    _pagination.update((val) => val.page = page);
  }

  void nextPage() => _changePage(_page + 1);
}
