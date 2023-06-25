import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task/data/app_exceptions.dart';
import 'package:task/model/Movie.dart';
import 'package:task/utils/flushbar.dart';

class MovieServices {
  Future<Movie> getMovies(String url, BuildContext context) async {
    try {
      final response = await http.get(Uri.parse(url));
      var data;
      if (response.statusCode == 200) {
        data = jsonDecode(response.body.toString());
        return Movie.fromJson(data);
      }
    } on SocketException {
      throw InternetException();
    } on RequestTimeout {
      throw RequestTimeout('');
    } catch (e) {
      await Utils.flushBar(e.toString(), context, 'Error');
    }
    throw FetchDataException('');
  }
}
