import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_movies/app/modules/search/search_controller.dart';

class SearchPage extends StatelessWidget {
  //
  final SearchController _searchController;

  const SearchPage(this._searchController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 50),
                // Container Title
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  height: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PESQUISAR',
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Container(
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).accentColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: new ListTile(
                          leading: new Icon(
                            Icons.search,
                            size: 20,
                          ),
                          title: TextField(
                            autofocus: true,
                            decoration: new InputDecoration(
                              hintText: 'Pesquisar',
                              border: InputBorder.none,
                            ),
                            onChanged: (value) {
                              _searchController.clearList();
                              _searchController.findSearchMovies(value);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25.0),

                // List
                Container(
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                  child: Obx(
                    () => Center(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _searchController.searchMovies.length,
                        itemBuilder: (_, index) {
                          print(_searchController.searchMovies.length);
                          var movie = _searchController.searchMovies[index];
                          return InkWell(
                            onTap: () {
                              Get.toNamed('/detail', arguments: movie);
                            },
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    right: 20.0,
                                    left: 20.0,
                                    top: 10.0,
                                    bottom: 10.0,
                                  ),
                                  width: 235,
                                  height: 315,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                        'https://image.tmdb.org/t/p/w500/${movie.poster_path}',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.2),
                                        blurRadius: 1.5,
                                        spreadRadius: 1.5,
                                        offset: Offset(
                                          2.0,
                                          2.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 5),
                                  width: 175,
                                  child: Text(
                                    movie.title,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Text(
                                  movie.release_date.split('-')[0],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
