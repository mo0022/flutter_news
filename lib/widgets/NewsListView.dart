import 'package:flutter/material.dart';
import 'package:new_pp/Data/api_model.dart';
import 'package:new_pp/widgets/card.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({
    super.key,
    required this.articles,
  });

  final List<NewsModel>? articles;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: articles!.length,
      itemBuilder: (BuildContext context, int index) {
        final article = articles![index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Breaking News Section

            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/details',
                  arguments: article, // Pass article to Details
                );
              },
              child: Card1(
                image: article.urlToImage ?? '',
                title: article.title ?? 'No Title Available',
                description: article.description ?? 'No Description Available',
              ),
            ),
          ],
        );
      },
    );
  }
}
