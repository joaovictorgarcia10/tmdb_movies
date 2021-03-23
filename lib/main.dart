import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_movies/app/modules/bottomNavBar/nav_bar.dart';
import 'package:tmdb_movies/app/modules/home/detail/detail_binding.dart';
import 'package:tmdb_movies/app/modules/home/detail/detail_page.dart';
import 'package:tmdb_movies/app/modules/home/home_binding.dart';
import 'package:tmdb_movies/app/modules/login/login_binding.dart';
import 'package:tmdb_movies/app/modules/login/login_page.dart';
import 'package:tmdb_movies/app/modules/login/recover_password/recover_page.dart';
import 'package:tmdb_movies/app/modules/login/register/register_page.dart';
import 'package:tmdb_movies/app/modules/search/search_binding.dart';
import 'package:tmdb_movies/app/shared/app_binding.dart';
import 'package:tmdb_movies/app/shared/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter TMDB Movies',
      theme: appTheme(),
      debugShowCheckedModeBanner: false,

      initialBinding: AppBinding(),
      // Pages Named Routes
      getPages: [
        GetPage(
          name: '/',
          page: () => LoginPage(),
          bindings: [
            LoginBinding(),
          ],
          children: [
            GetPage(
              name: '/register',
              page: () => RegisterPage(),
            ),
            GetPage(
              name: '/recover',
              page: () => RecoverPage(),
            ),
          ],
        ),

        //
        GetPage(
          name: '/home',
          page: () => NavBar(),
          bindings: [
            HomeBinding(),
            SearchBinding(),
          ],
        ),
        GetPage(
          name: '/detail',
          page: () => DetailPage(Get.find()),
          binding: DetailBinding(),
        ),
      ],
    );
  }
}
