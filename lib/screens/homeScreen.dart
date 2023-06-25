import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/res/pageController.dart';
import 'package:task/screens/topRated.dart';
import 'package:task/screens/upcoming.dart';

import 'favorite.dart';
import 'popular.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageValueController _pageValueController = Get.put(PageValueController());

  ///Screens in the tab bar
  final page = [
    const Popular(),
    const TopRated(),
    const UpComing(),
    const Favorite(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => page[_pageValueController.value.toInt()]),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Obx(
                () => SalomonBottomBar(
                  curve: Curves.bounceIn,
                  items: [
                    SalomonBottomBarItem(
                        icon: const Icon(
                          Icons.movie_creation_outlined,
                          color: Colors.black,
                        ),
                        title: const Text(
                          'Popular',
                          style: TextStyle(color: Colors.white),
                        ),
                        activeIcon: const Icon(
                          Icons.movie,
                          color: Colors.white,
                        ),
                        selectedColor: Colors.indigo,
                        unselectedColor: Colors.grey),
                    SalomonBottomBarItem(
                        icon: const Icon(
                          Icons.star_border_outlined,
                          color: Colors.black,
                        ),
                        title: const Text(
                          'TopRated',
                          style: TextStyle(color: Colors.white),
                        ),
                        activeIcon: const Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                        selectedColor: Colors.indigo,
                        unselectedColor: Colors.grey),
                    SalomonBottomBarItem(
                        icon: const Icon(
                          Icons.upcoming_outlined,
                          color: Colors.black,
                        ),
                        title: const Text(
                          'UpComing',
                          style: TextStyle(color: Colors.white),
                        ),
                        activeIcon: const Icon(
                          Icons.upcoming,
                          color: Colors.white,
                        ),
                        selectedColor: Colors.indigo,
                        unselectedColor: Colors.grey),
                    SalomonBottomBarItem(
                        icon: const Icon(
                          Icons.favorite_border,
                          color: Colors.black,
                        ),
                        title: const Text(
                          'Favorite',
                          style: TextStyle(color: Colors.white),
                        ),
                        activeIcon: const Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                        selectedColor: Colors.indigo,
                        unselectedColor: Colors.grey),
                  ],
                  selectedColorOpacity: 1,
                  duration: const Duration(seconds: 1),
                  backgroundColor: Colors.grey.shade300,
                  currentIndex: _pageValueController.value.toInt(),
                  onTap: (val) async {
                    _pageValueController.pageChange(val);
                    FavoriteState.prefs = await SharedPreferences.getInstance();
                  },
                ),
              )),
        ));
  }
}
