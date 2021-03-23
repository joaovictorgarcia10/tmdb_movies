import 'package:get/get.dart';
import 'package:tmdb_movies/app/modules/home/detail/detail_controller.dart';
import 'package:tmdb_movies/app/repository/movies_reposritory.dart';

class DetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MoviesRepository(Get.find()));
    Get.lazyPut(() => DetailController(Get.find()));
  }
}
