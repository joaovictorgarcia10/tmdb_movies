import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  // Atributes
  HomeController _controller;

  // Constructor
  HomePage(this._controller);

  // Widgets
  Widget _moviesList(context) {
    return Container(
      width: double.infinity,
      height: 350,
      child: Obx(
        () => LazyLoadScrollView(
          scrollDirection: Axis.horizontal,
          onEndOfPage: _controller.nextPage,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _controller.popularMovies.length,
            itemBuilder: (_, index) {
              var movie = _controller.popularMovies[index];
              return InkWell(
                onTap: () {
                  Get.toNamed('/detail', arguments: movie);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(12.0),
                      width: 190,
                      height: 265,
                      decoration: BoxDecoration(
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
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      movie.release_date.split('-')[0],
                      style: TextStyle(
                        fontSize: 14,
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
    );
  }

  Widget _destaqueList(context) {
    return Column(
      children: [
        //  Destaque
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.only(left: 25.0, bottom: 10.0, top: 1.0),
            child: Text(
              'Destaques',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),

        // Destaque List
        Container(
          width: double.infinity,
          height: 215,
          child: Obx(
            () => Center(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _controller.popularMovies.length == 0 ? 0 : 6,
                itemBuilder: (_, index) {
                  print(_controller.popularMovies.length);
                  var movie = _controller.popularMovies[index];
                  return InkWell(
                    onTap: () {
                      Get.toNamed('/detail', arguments: movie);
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          right: 15.0, left: 15.0, top: 12.0, bottom: 8.0),
                      width: 350,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            'https://image.tmdb.org/t/p/w500/${movie.backdrop_path}',
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
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _changeListButton(context) {
    return // Change List Button
        Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () {
          _controller.changeList();
        },
        child: Obx(
          () => Container(
            margin: EdgeInsets.all(20.0),
            height: 35,
            width: 200,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(26)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 35,
                  width: 100,
                  decoration: BoxDecoration(
                    //
                    color: _controller.selectedList
                        ? Theme.of(context).accentColor.withOpacity(0.3)
                        : Theme.of(context).primaryColor,
                    //
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(26),
                      bottomLeft: Radius.circular(26),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Populares',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 35,
                  width: 100,
                  decoration: BoxDecoration(
                    color: _controller.selectedList
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).accentColor.withOpacity(0.3),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(26),
                      bottomRight: Radius.circular(26),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Em cartaz',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      //

      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 50),
                // Container Title
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  height: 90,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'TMDB MOVIES',
                            style: TextStyle(
                              fontSize: 38,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),
                    ],
                  ),
                ),

                // Controle do estado da tela baseado na lista popularMovies

                // Se a lista não estiver vazia
                Obx(
                  () => _controller.popularMovies.isNotEmpty
                      ? Column(
                          children: [
                            _destaqueList(context),
                            SizedBox(height: 25.0),
                            _changeListButton(context),
                            SizedBox(height: 10.0),
                            _moviesList(context),
                            SizedBox(height: 30.0),
                          ],
                        )

                      // Se a lista estiver vazia
                      : _controller.popularMovies.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 200),
                                  CircularProgressIndicator(),
                                  SizedBox(height: 15),
                                  Text(
                                    'Carregando Filmes',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            )

                          // Se não...
                          : Center(
                              child: TextButton(
                                onPressed: () {
                                  _controller.onInit();
                                },
                                child: Text('Tentar Novamente'),
                              ),
                            ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
