import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:new_pp/Data/api_model.dart';
import 'package:new_pp/widgets/carouselItem.dart';

class Carousel1 extends StatelessWidget {
  const Carousel1({
    super.key,
    required this.articles,
  });

  final List<NewsModel>? articles;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: articles?.asMap().entries.map<Widget>((entry) {
        final int index = entry.key;
        final article = entry.value;

        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/details',
              arguments: article, // Pass the selected article
            );
          },
          child: Carousel(
            image: article.urlToImage ??
                "https://images.wsj.net/im-76943017/social",
            title: article.title ?? 'No Title Available',
          ),
        );
      }).toList(),
      options: CarouselOptions(
        height: 200,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
