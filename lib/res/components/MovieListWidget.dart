import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/data/network/MovieServices.dart';
import 'package:task/res/favoriteController.dart';
import 'package:task/utils/dialogBox.dart';

import 'picWidget.dart';
import 'titleInfoWidget.dart';

class MovieListWidget extends StatefulWidget {
  String url;
  MovieListWidget({super.key, required this.url});

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  @override
  Widget build(BuildContext context) {
    var favoriteController = Get.put(FavouriteController());
    var height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: height * 0.03,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          FutureBuilder(
            future: MovieServices().getMovies(widget.url, context),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                          itemCount: snapshot.data!.results!.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final image = snapshot
                                .data!.results![index].posterPath
                                .toString();
                            return Container(
                              margin: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 4,
                              child: Stack(
                                children: [
                                  ///titleInfo Widget
                                  TitleInfoWidget(
                                      image: image,
                                      over: snapshot
                                          .data!.results![index].overview
                                          .toString(),
                                      title: snapshot
                                          .data!.results![index].title
                                          .toString(),
                                      releaseDate: snapshot
                                          .data!.results![index].releaseDate
                                          .toString(),
                                      onTap: () {
                                        ///Overview Field From API
                                        DialogBox().alertDialog(
                                            snapshot
                                                .data!.results![index].overview
                                                .toString(),
                                            context);
                                      },

                                      ///check if itme in favorite then remove otherwise add
                                      onFavorite: () async {
                                        ///removing item on click that's already in the Favorite List
                                        if (favoriteController.favouriteTitle
                                            .contains(snapshot
                                                .data!.results![index].title
                                                .toString())) {
                                          favoriteController.removeImage(
                                              snapshot.data!.results![index]
                                                  .posterPath
                                                  .toString());
                                          favoriteController.removeTitle(
                                              snapshot
                                                  .data!.results![index].title
                                                  .toString());
                                          favoriteController.removeLang(snapshot
                                              .data!
                                              .results![index]
                                              .originalLanguage
                                              .toString());
                                          favoriteController.removeDate(snapshot
                                              .data!.results![index].releaseDate
                                              .toString());
                                          favoriteController.removeOver(snapshot
                                              .data!.results![index].overview
                                              .toString());
                                        }

                                        ///Adding items on click that's not in the Favorite List
                                        else {
                                          favoriteController.addImage(snapshot
                                              .data!.results![index].posterPath
                                              .toString());
                                          favoriteController.addTitle(snapshot
                                              .data!.results![index].title
                                              .toString());
                                          favoriteController.addLang(snapshot
                                              .data!
                                              .results![index]
                                              .originalLanguage
                                              .toString());
                                          favoriteController.addDate(snapshot
                                              .data!
                                              .results![index]
                                              .originalLanguage
                                              .toString());
                                          favoriteController.addOver(snapshot
                                              .data!.results![index].overview
                                              .toString());
                                        }
                                      },
                                      language: snapshot.data!.results![index]
                                          .originalLanguage
                                          .toString()),

                                  ///pic widget
                                  PicWidget(
                                    image: image,
                                  )
                                ],
                              ),
                            );
                          })
                    ],
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
