import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteController extends GetxController {
  var favouriteImage = <String>[].obs;
  var favouriteTitle = <String>[].obs;
  var favouriteDate = <String>[].obs;
  var favouriteOver = <String>[].obs;
  var favouriteLang = <String>[].obs;

  ///Removing methods form Shared Preference and favorite list
  removeImage(String value) async {
    favouriteImage.remove(value);
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setStringList('Image', favouriteImage);
  }

  removeTitle(String value) async {
    favouriteTitle.remove(value);
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setStringList('Title', favouriteTitle);
  }

  removeDate(String value) async {
    favouriteDate.remove(value);
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setStringList('Date', favouriteDate);
  }

  removeLang(String value) async {
    favouriteLang.remove(value);
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setStringList('Lang', favouriteLang);
  }

  removeOver(String value) async {
    favouriteOver.remove(value);
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setStringList('Over', favouriteOver);
  }

  ///Adding methods form Shared Preference and favorite list
  addImage(String e) async {
    favouriteImage.add(e);
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setStringList('Image', favouriteImage);
  }

  addTitle(String e) async {
    favouriteTitle.add(e);
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setStringList('Title', favouriteTitle);
  }

  addDate(String e) async {
    favouriteDate.add(e);
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setStringList('Date', favouriteDate);
  }

  addLang(String e) async {
    favouriteLang.add(e);
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setStringList('Lang', favouriteLang);
  }

  addOver(String e) async {
    favouriteOver.add(e);
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setStringList('Over', favouriteOver);
  }
}
