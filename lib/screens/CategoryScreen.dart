import 'package:flutter/material.dart';

import 'package:new_pp/Data/api_model.dart';
import 'package:new_pp/Data/categoryData.dart';
import 'package:new_pp/widgets/card.dart';

class Categoryscreen extends StatelessWidget {
  final CategoryNews categoryNews = CategoryNews();

  Categoryscreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve category name from navigation arguments
    final String category =
        ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          category,
          style:
              const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ), // Dynamic category title
      ),
      body: FutureBuilder<List<NewsModel>>(
        future: categoryNews.getNews(category), // Fetch category news
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No articles available.'));
          }

          final articles = snapshot.data!;

          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final item = articles[index];

              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/details', arguments: item);
                },
                child: Card1(
                  image: item.urlToImage ??
                      'images/pexels-fotios-photos-1369476.jpg',
                  title: item.title ?? 'No Title Available',
                  description: item.description ?? 'No Description Available',
                ),
              );
            },
          );
        },
      ),
    );
  }
}
