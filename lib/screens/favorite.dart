import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/res/components/picWidget.dart';
import 'package:task/res/components/titleInfoWidget.dart';
import 'package:task/res/favoriteController.dart';
import 'package:task/utils/dialogBox.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => FavoriteState();
}

class FavoriteState extends State<Favorite> {
  static SharedPreferences? prefs;
  List? favoriteImage;
  List? favoriteTitle;
  List? favoriteDate;
  List? favoriteOver;
  List? favoriteLang;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (prefs != null) {
      ///fetching data from Shared Preference in a list
      favoriteImage = (prefs!.getStringList('Image') ?? '') as List?;
      favoriteTitle = (prefs!.getStringList('Title') ?? '') as List?;
      favoriteLang = (prefs!.getStringList('Lang') ?? '') as List?;
      favoriteDate = (prefs!.getStringList('Date') ?? '') as List?;
      favoriteOver = (prefs!.getStringList('Over') ?? '') as List?;
    } else {
      print('null');
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var favoriteController = Get.put(FavouriteController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 2,
          shadowColor: Colors.grey.shade300,
          shape: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade50)),
          centerTitle: true,
          title: const Text(
            'Favorite',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.03,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              favoriteTitle == null
                  ? const Center(
                      child: Text('Nothing In The Favorite'),
                    )
                  : SingleChildScrollView(
                      child: Column(
                      children: [
                        ListView.builder(
                            itemCount: favoriteTitle!.length,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                margin:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 5),
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height / 4,
                                child: Stack(
                                  children: [
                                    ///titleInfo Widget
                                    TitleInfoWidget(
                                      onFavorite: () async {
                                        ///removing item on click that's already in the Favorite List
                                        if (favoriteController.favouriteTitle
                                            .contains(favoriteTitle![index])) {
                                          favoriteController.removeImage(
                                              favoriteImage![index]);
                                          favoriteController.removeTitle(
                                              favoriteTitle![index]);
                                          favoriteController
                                              .removeLang(favoriteLang![index]);
                                          favoriteController
                                              .removeDate(favoriteDate![index]);
                                          favoriteController
                                              .removeOver(favoriteOver![index]);
                                        }
                                      },
                                      image:
                                          'https://image.tmdb.org/t/p/w342${favoriteImage![index]}',
                                      over: favoriteOver![index],
                                      title: favoriteTitle![index],
                                      releaseDate: favoriteDate![index],

                                      ///Overview Field From API
                                      onTap: () {
                                        DialogBox().alertDialog(
                                            favoriteOver![index], context);
                                      },
                                      language: favoriteLang![index],
                                    ),

                                    ///pic widget
                                    PicWidget(
                                      image:
                                          'https://image.tmdb.org/t/p/w342${favoriteImage![index]}',
                                    )
                                  ],
                                ),
                              );
                            })
                      ],
                    ))
            ],
          ),
        ));
  }
}
