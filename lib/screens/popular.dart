import 'package:flutter/material.dart';
import 'package:task/res/app_urls.dart';
import 'package:task/res/components/MovieListWidget.dart';

class Popular extends StatefulWidget {
  const Popular({super.key});

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {
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
          'Popular',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: MovieListWidget(url: AppUrls.popularMovie),
    );
  }
}
