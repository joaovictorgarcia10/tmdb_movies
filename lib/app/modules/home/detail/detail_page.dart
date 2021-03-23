import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_movies/app/modules/home/detail/detail_controller.dart';

class DetailPage extends StatelessWidget {
  // Objeto Passado Como Argumento
  var movieDetail = Get.arguments;

  final DetailController _detailController;

  DetailPage(this._detailController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:

            // Tratamento caso o Get Arguments venha nulo
            movieDetail == null
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Theme.of(context).primaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Erro ao buscar detalhes do filme',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 5),
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text('Tentar Novamente'),
                        ),
                      ],
                    ),
                  )

                // Se não ...
                : SafeArea(
                    // Background
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            'https://image.tmdb.org/t/p/w500/${movieDetail.poster_path}',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        children: [
                          // Transparent Container
                          Container(
                            padding: EdgeInsets.only(top: 65.0, left: 10.0),
                            height: MediaQuery.of(context).size.height / 1.4,
                            color: Colors.transparent,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Theme.of(context)
                                      .accentColor
                                      .withOpacity(0.3),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_back_ios_outlined,
                                    color: Theme.of(context).primaryColor,
                                    size: 18,
                                  ),
                                  onPressed: () {
                                    Get.back();
                                  },
                                ),
                              ),
                            ),
                          ),

                          // Movie Details Container
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(54),
                                topRight: Radius.circular(54),
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(25),
                                  child: Column(
                                    children: [
                                      // Title and FavButton Row
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 220,
                                            child: Text(
                                              movieDetail.title,
                                              style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(26),
                                              color: Theme.of(context)
                                                  .accentColor
                                                  .withOpacity(0.15),
                                            ),
                                            child: Obx(
                                              () => IconButton(
                                                icon: Icon(
                                                  !_detailController.favorite
                                                      ? Icons.favorite_border
                                                      : Icons.favorite,
                                                  size: 20,
                                                  color: Colors.red,
                                                ),
                                                onPressed: () {
                                                  _detailController
                                                      .addToFavoriteList();
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      // Date, Note and Popularity Row
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            movieDetail.release_date,
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                movieDetail.vote_average
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow[900],
                                              ),
                                            ],
                                          ),
                                          Text(
                                            'Popularidade: ${movieDetail.popularity}',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 30),
                                // Description Container
                                Container(
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0),
                                            child: Text(
                                              'Descrição',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: Text(
                                          movieDetail.overview,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            wordSpacing: 1.5,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 30),
                                // Cast List
                              ],
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
