import 'package:flutter/material.dart';
import 'package:new_pp/Data/api_data.dart';

import 'package:new_pp/widgets/NewsListView.dart';
import 'package:new_pp/widgets/appbarText.dart';

import 'package:new_pp/widgets/carousel.dart';

import 'package:new_pp/widgets/categoryListView.dart';
import 'package:new_pp/widgets/customText.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final News news = News();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: news.getNews(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No articles available.'));
        }

        var articles = snapshot.data;

        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppBarText(title: "Flutter ", color: Colors.black),
                  AppBarText(
                    title: 'News',
                    color: Colors.blue,
                  ),
                ],
              ),
           
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title: 'Category',
                  ),
                  SizedBox(
                    height: 150.0, // Set a fixed height
                    child: CstegoryListView(),
                  ),
                  CustomText(title: "Breaking News"),
                  Carousel1(articles: articles),
                  CustomText(title: "Recent News"),
                  NewsListView(articles: articles),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
