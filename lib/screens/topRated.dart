import 'package:flutter/material.dart';
import 'package:task/res/app_urls.dart';
import 'package:task/res/components/MovieListWidget.dart';

class TopRated extends StatefulWidget {
  const TopRated({super.key});

  @override
  State<TopRated> createState() => _TopRatedState();
}

class _TopRatedState extends State<TopRated> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.grey.shade300,
        shape: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade50)),
        centerTitle: true,
        title: const Text(
          'Top Rated',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: MovieListWidget(url: AppUrls.topRatedMovie),
    );
  }
}
