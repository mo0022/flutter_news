import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:new_pp/Data/api_model.dart';

class CategoryNews {
  final String apiKey = "01ca85c2b71b4a31ad3589fb810d3d0c"; // Replace with your API key

  Future<List<NewsModel>> getNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?category=$category&country=us&apiKey=$apiKey";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<dynamic> articlesJson = data['articles'];

      return articlesJson.map((json) => NewsModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load news: ${response.body}');
    }
  }
}
