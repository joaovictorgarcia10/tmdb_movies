import 'package:get/get.dart';
import 'package:tmdb_movies/app/modules/search/search_controller.dart';
import 'package:tmdb_movies/app/repository/movies_reposritory.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MoviesRepository(Get.find()));
    Get.lazyPut(() => SearchController(Get.find()));
  }
}
