import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_movies/app/modules/bottomNavBar/nav_controller.dart';
import 'package:tmdb_movies/app/modules/favorites/favorites_page.dart';
import 'package:tmdb_movies/app/modules/home/home_page.dart';
import 'package:tmdb_movies/app/modules/search/search_page.dart';
import 'package:tmdb_movies/app/modules/settings/settings_page.dart';

class NavBar extends StatelessWidget {
  //

  NavController navController = Get.put(NavController());

  final List<Widget> bodyContent = [
    HomePage(Get.find()),
    FavoritesPage(),
    SearchPage(Get.find()),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Center(
          child: bodyContent.elementAt(navController.selectedIndex),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          fixedColor: Colors.white,
          unselectedItemColor: Colors.white,
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 10,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favoritos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Pesquisar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Ajustes',
            ),
          ],
          currentIndex: navController.selectedIndex,
          onTap: (index) => navController.selectedIndex = index,
        ),
      ),
    );
  }
}
