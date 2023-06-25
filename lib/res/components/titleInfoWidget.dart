import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/res/favoriteController.dart';

class TitleInfoWidget extends StatefulWidget {
  VoidCallback onTap;
  VoidCallback? onFavorite;
  String over;
  String title;
  String releaseDate;
  String image;
  String language;
  TitleInfoWidget(
      {super.key,
      this.onFavorite,
      required this.image,
      required this.over,
      required this.title,
      required this.releaseDate,
      required this.onTap,
      required this.language});

  @override
  State<TitleInfoWidget> createState() => TitleInfoWidgetState();
}

class TitleInfoWidgetState extends State<TitleInfoWidget> {
  @override
  Widget build(BuildContext context) {
    var favoriteController = Get.put(FavouriteController());
    return Align(
      alignment: Alignment.bottomRight,
      child: Material(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
        child: Container(
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    blurRadius: 3, offset: Offset(2, 2), color: Colors.grey)
              ],
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            width: MediaQuery.of(context).size.width / 1.6,
            height: MediaQuery.of(context).size.height * 0.14,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3, vertical: 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(color: Colors.green)),
                      child: Text(
                        'Release Date: ${widget.releaseDate}',
                        style:
                            const TextStyle(fontSize: 10, color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Language',
                          style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        const CircleAvatar(
                            backgroundColor: Colors.red, radius: 2),
                        const SizedBox(
                          width: 7,
                        ),
                        Text(
                          widget.language,
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.green),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const CircleAvatar(
                            backgroundColor: Colors.red, radius: 2),
                        const SizedBox(
                          width: 7,
                        ),
                        InkWell(
                          onTap: widget.onTap,
                          child: const Icon(Icons.more_horiz),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const CircleAvatar(
                            backgroundColor: Colors.red, radius: 2),
                        const SizedBox(
                          width: 7,
                        ),
                        InkWell(
                          onTap: widget.onFavorite,
                          child: Obx(() => Icon(
                                favoriteController.favouriteTitle
                                        .contains(widget.title)
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 15,
                              )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
