import 'package:flutter/material.dart';
import 'package:task/res/app_urls.dart';
import 'package:task/res/components/MovieListWidget.dart';

class UpComing extends StatefulWidget {
  const UpComing({super.key});

  @override
  State<UpComing> createState() => _UpComingState();
}

class _UpComingState extends State<UpComing> {
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
          'Up Coming',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: MovieListWidget(url: AppUrls.upComingMovie),
    );
  }
}
