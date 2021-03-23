import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tmdb_movies/app/modules/home/home_controller.dart';
import 'package:tmdb_movies/app/repository/movies_reposritory.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MoviesRepository(Get.find()));
    Get.lazyPut(() => HomeController(Get.find()));
  }
}
